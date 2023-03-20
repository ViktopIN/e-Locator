//
//  UIView+Extensions.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

extension UIView {
    
    // MARK: - Init
    
    convenience init(background color: UIColor,
                     cornerType: CornerType = .none) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        guard cornerType == .rounded else { return }
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
    
    // MARK: - Methods
    
    func addSubviews(_ views: UIView...) {
        views.forEach{ self.addSubview($0) }
    }
    
    func fillSuperview(considerAllMargins guide: Bool = false, with insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else { return }
        NSLayoutConstraint.activate(
            [self.topAnchor.constraint(
                equalTo: !guide ? superview.topAnchor : superview.layoutMarginsGuide.topAnchor,
                constant: insets.top
            ),
            self.leadingAnchor.constraint(
                equalTo: !guide ? superview.leadingAnchor : superview.layoutMarginsGuide.leadingAnchor,
                constant: insets.left
            ),
            self.trailingAnchor.constraint(
                equalTo: !guide ? superview.trailingAnchor : superview.layoutMarginsGuide.trailingAnchor,
                constant: insets.right
            ),
            self.bottomAnchor.constraint(
                equalTo: !guide ? superview.bottomAnchor : superview.layoutMarginsGuide.bottomAnchor,
                constant: insets.bottom
            )
            ]
        )
    }
}

extension UIView {
    enum CornerType {
        case none, rounded
    }
}
