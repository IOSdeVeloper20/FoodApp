//
//  OnBoardingVC.swift
//  FoodApp
//
//  Created by ahmed sherif on 30/01/2023.
//

import UIKit

class OnBoardingVC: UIViewController {
//MARK:IBOutlets
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if (currentPage == slides.count - 1){
            let controller = storyboard?.instantiateViewController(withIdentifier: Constants.mainNavigation) as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            //present the nvigation controller which will present other viewControllers
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            //give the order to scroll
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
//MARK: Variables
    var slides = [
        OnBoardingSlide(title: "Dlecious Dishes", description: "Experience a variety of amazing dishes from defferent cultures around the world.", image: UIImage(named: "slide1")!),
            OnBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide2")!),
            OnBoardingSlide(title: "Instant World-Wide Delivery ", description: "Your orders will be delivered instantly irrespective of your location around the world", image: UIImage(named: "slide3")!)
    ]
    var currentPage = 0 {
        didSet{
            //update page control
            PageControl.currentPage = currentPage
            //the count of elementns in array are 3 but end index = 2 -> 2 = 2
            if (currentPage == slides.count - 1)  {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
//MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        PageControl.numberOfPages = slides.count
    }
}

//MARK: VC Extension
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
     //what to show in cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.OnBoardingCollectionID, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        
        return cell
    }
    
    //to control the size of each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //to make page control word
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width )
    }
}
