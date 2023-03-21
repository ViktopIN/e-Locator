//
//  UIStackView+Extension.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

extension UIStackView {
    static func configureStackView(
        with axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        if layoutMargins != .zero {
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = layoutMargins
        }
        return stackView
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}

