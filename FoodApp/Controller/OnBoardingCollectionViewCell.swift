//
//  OnBoardingCollectionViewCell.swift
//  FoodApp
//
//  Created by ahmed sherif on 31/01/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var SlideImageView: UIImageView!
    @IBOutlet weak var SlideTitleLabel: UILabel!
    @IBOutlet weak var SlideDescriptionLabel: UILabel!
    
    func setUp(_ slide: OnBoardingSlide) {
        SlideImageView.image = slide.image
        SlideTitleLabel.text = slide.title
        SlideDescriptionLabel.text = slide.description
    }
}
