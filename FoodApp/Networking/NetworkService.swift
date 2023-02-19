//
//  NetworkService.swift
//  FoodApp
//
//  Created by ahmed sherif on 19/02/2023.
//

import Foundation

struct NetworkService {
    /// This function helps us to generate url reuquest
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URL request
    func createRequest(route: Route, method: Method, parameters: [String : Any]? = nil) -> URLRequest? {
        
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
}
 
