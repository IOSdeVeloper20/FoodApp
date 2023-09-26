//
//  NetworkService.swift
//  FoodApp
//
//  Created by ahmed sherif on 19/02/2023.
//

import Foundation

struct NetworkService {
    
    //singleton
    static let shared = NetworkService()
    
    private init() {}
    
    /*hint : @escaping means the closure will out live even after the function is excuted*/
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     //parameters can be nill
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data"
                print("the response is: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(String(describing: error.localizedDescription))")
                print(result!)
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse <T:Decodable> (result: Result<Data, Error>?,
                                               completion: (Result<T, Error>) -> Void) {
        //check if result returned something or not
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        // see if result was success or failure
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try?
                    decoder.decode(APIResponse<T>.self, from: data)
            else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            // to check if did decode with data or error
            // if decoded with error
            if let error = response.error{
                completion(.failure(AppError.serverError(error)))
                return
            }
            // if decoded with data
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// This function helps us to generate url reuquest
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URL request
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String : Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseURL + route.description
            // check if the url has data or not (valid or not)
        guard let url = urlString.asUrl else { return nil }
            // make a request using the url
        var urlRequest = URLRequest(url: url)
            // what kind of request we will send
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // specify the type of our method
            //.rawValue is the corresponding value of raw type
        urlRequest.httpMethod = method.rawValue
            // check if there is parameters or not
        if let params = parameters {
                // if there was any parameters then we will deal depending on the type of our method
            switch method {
                // in get method we add the parameters to the url directly
            case .get:
                // to add parameters to the url as queryItems using map
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: "\($0)", value: "\($1)")}
                        //update the urlRequest with the new url wiht components
                urlRequest.url = urlComponent?.url
            // in other method types we add the parameters to the body
            case .post, .delete, .patch:
                // pass the parameters in the httpBody as bodyData
                let bodyData = try?
                JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void){
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func PlaceOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
        
        let params = ["name" : name]
        
        request(route: .placeOrder(dishId), method: .post,parameters: params, completion: completion)
    }
    
    func fetchCategoryDishes(categoryID: String, completion: @escaping(Result<[Dish], Error>) -> Void){
        request(route: .fetchCategoryDishes(categoryID), method: .get, completion: completion)
    }
    
    func fetchOrders(completion: @escaping(Result<[Order], Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
}
 
