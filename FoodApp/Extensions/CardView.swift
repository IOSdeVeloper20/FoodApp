//
//  CardView.swift
//  FoodApp
//
//  Created by ahmed sherif on 03/02/2023.
//

import Foundation
import UIKit

// to make shadow for collectionView cells
class CardView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        initialSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetUp()
    }
    
    private func initialSetUp() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
    }
}
