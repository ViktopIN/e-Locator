//
//  File.swift
//  Ecommerce-Concept
//
//  Created by Виктор on 17.12.2022.
//

import UIKit.UIImageView

extension UIImageView {
    convenience init(baseImage: UIImage?,
                     with color: UIColor? = .link) {
        self.init()
        guard let color = color else {
            self.image = baseImage
            return
        }
        self.image = baseImage?.withTintColor(color, renderingMode: .alwaysOriginal)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .center
    }
}
