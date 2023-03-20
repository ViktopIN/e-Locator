//
//  String+Extension.swift
//  Ecommerce-Concept
//
//  Created by Виктор on 06.01.2023.
//

import UIKit

extension String {
    var withDollarBefore: String {
        "\u{0024} " + "\(self).00"
    }
    func width(withConstrainedHeight height: CGFloat,
               font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude,
                                    height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.width)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
    
        return ceil(boundingBox.height)
    }
    
    func addToCartTransformText() -> String {
        return "Add to Cart          \(self)"
    }
    func increase(on: Int) -> String {
        guard var number = Int(self) else { return self }
        number += on
        return String(describing: number)
    }
    
    func decrease(on: Int) -> String {
        guard var number = Int(self) else { return self }
        number -= on
        return String(describing: number)
    }
}
