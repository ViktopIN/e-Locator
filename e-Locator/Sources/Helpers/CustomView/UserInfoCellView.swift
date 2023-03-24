//
//  UserInfoCellView.swift
//  e-Locator
//
//  Created by Виктор on 23.03.2023.
//

import UIKit
import SnapKit

final class UserInfoCellView: UIView {
    
    // MARK: - Properties
    
    var recieveDataAction: ((String) -> ())?
    var cancelChoiseAction: (() -> Void)?
        
    // MARK: - Views
    
    private lazy var mainStackView = UIStackView.configureStackView(
        with: .horizontal,
        spacing: 20
    )
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var labelStack = UIStackView.configureStackView(with: .vertical)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
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
        
        button.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
                
        return button
    }()

    // MARK: - Initializer
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
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
            avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        }
    }

    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubviews(
            avatarImageView,
            labelStack,
            favoriteMarkButton
        )
        labelStack.addArrangedSubviews(
            nameLabel,
            distanceLabel
        )
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
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Methods
    
    func configurationView(with data: UserDistanceModel) {
        avatarImageView.image = data.image
        nameLabel.text = data.name
        distanceLabel.text = data.distanceDescription
    }
    
    func configureSelectMarkButton(is value: Bool) {
        favoriteMarkButton.isSelected = value
    }
    
    func configureLikePopUpView() {
        distanceLabel.isHidden = true
    }

    @objc
    private func favoriteButtonAction() {
        favoriteMarkButton.isSelected.toggle()
        if favoriteMarkButton.isSelected {
            guard let recieveDataAction = recieveDataAction else { return }
            recieveDataAction(nameLabel.text ?? "User")
        } else {
            guard let cancelChoiseAction = cancelChoiseAction else { return }
            cancelChoiseAction()
        }
    }
}
