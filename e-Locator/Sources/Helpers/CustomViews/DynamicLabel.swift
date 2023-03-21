//
//  DynamicLabel.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

class DynamicLabel: UILabel {
    
    override var intrinsicContentSize: CGSize {
        let size = sizeThatFits(CGSize(
            width: frame.width,
            height: CGFloat.greatestFiniteMagnitude
        ))
        return CGSize(width: size.width + 5, height: size.height + 5)
    }
}
