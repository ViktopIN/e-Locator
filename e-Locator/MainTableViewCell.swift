//
//  MainTableViewCell.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MainTableViewCell"
    
    // MARK: - Views
    
    private lazy var mainStackView = UIStackView.configureStackView(with: .horizontal, spacing: 20)
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelStack = UIStackView.configureStackView(with: .vertical)
    
    private lazy var nameLabel: DynamicLabel = {
        let label = DynamicLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var distanceLabel: DynamicLabel = {
        let label = DynamicLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var favoriteMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            for: .normal
        )
        button.setImage(UIImage(
            systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal),
            for: .selected
        )
        button.backgroundColor = .white
        button.imageView?.contentMode = .center
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
                
        return button
    }()

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [unowned self] in
            favoriteMarkButton.layer.cornerRadius = favoriteMarkButton.bounds.height / 2
            avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        }
    }

    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubviews(avatarImageView, labelStack, favoriteMarkButton)
        labelStack.addArrangedSubviews(nameLabel, distanceLabel)
    }
    
    private func setupLayout() {
        mainStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        avatarImageView.snp.makeConstraints { make in
            make.width.equalTo(avatarImageView.snp.height)
        }
        favoriteMarkButton.snp.makeConstraints { make in
            make.width.equalTo(favoriteMarkButton.snp.height)
        }
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    // MARK: - Methods
    
    func configurationCell(image: UIImage?, nameLabelText: String, distanceText: String) {
        avatarImageView.image = image
        nameLabel.text = nameLabelText
        distanceLabel.text = distanceText
    }
}
