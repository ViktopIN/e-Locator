//
//  MainView.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Views
    
    private lazy var mainStackView = UIStackView.configureStackView(with: .vertical)
    
    private lazy var titleLabel: DynamicLabel = {
        let label = DynamicLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "e-Locator"
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupHierarchy()
        setupLayout()
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
    }
    
    private func setupLayout() {
        mainStackView.fillSuperview()
    }
    
    private func setupView() {
        
    }
}
