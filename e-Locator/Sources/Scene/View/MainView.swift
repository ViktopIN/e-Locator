//
//  MainView.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    // MARK: - Properties
    
    var tableViewHeightConstraint: Constraint!
    var tableViewRowHeight: CGFloat = UIScreen.main.bounds.height / 13
    private var popUpLeadingConstraint: Constraint!
    
    // MARK: - Views
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView = UIView(background: .clear)
    
    private lazy var loadingIndicatorActivity: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        return activityIndicator
    }()
            
    var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return tableView
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private lazy var popUpUserView: UserInfoCellView = {
        let view = UserInfoCellView()
        view.configureSelectMarkButton()
        view.configurePopUpView()
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 20
        
        return view
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
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
        popUpLeadingConstraint?.update(offset: -bounds.width)
    }
                
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubviews(mainScrollView, statusLabel, popUpUserView)
        mainScrollView.addSubviews(loadingIndicatorActivity, containerView)
        containerView.addSubview(mainTableView)
    }
    
    private func setupLayout() {
        mainScrollView.fillSuperview()
        containerView.fillSuperview()
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(mainTableView.snp.height).offset(30)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            tableViewHeightConstraint = make.height.equalTo(0).constraint
        }
        
        loadingIndicatorActivity.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.centerX.equalTo(containerView.snp.centerX)
            make.width.equalTo(containerView.snp.width)
            make.bottom.equalTo(snp.bottom)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().dividedBy(3)
        }
        
        popUpUserView.snp.makeConstraints { make in
            make.width.equalTo(containerView.snp.width).multipliedBy(0.95)
            make.top.equalTo(layoutMarginsGuide.snp.top).inset(20)
            popUpLeadingConstraint = make.centerX.equalTo(containerView.snp.centerX).constraint
            make.height.equalTo(tableViewRowHeight)
        }
    }
    
    private func setupView() {
        backgroundColor = .mainBackgroundColor
        mainTableView.rowHeight = tableViewRowHeight
    }
    
    // MARK: - Methods
    
    func switchOffIndicatorView(to value: Bool) {
        if value {
            loadingIndicatorActivity.isHidden = false
            loadingIndicatorActivity.startAnimating()
        } else {
            loadingIndicatorActivity.stopAnimating()
        }
    }
    
    func showPopUpViewis(_ value: Bool) {
        UIView.animate(
            withDuration: 0.4,
            animations: { [unowned self] in
                if value {
                    popUpLeadingConstraint?.deactivate()
                } else {
                    popUpLeadingConstraint?.activate()
                }
                popUpUserView.center.x += value ? bounds.width : -bounds.width
            }) { [unowned self] isFinished in
                if isFinished {
                    popUpUserView.configureSelectMarkButton()
                }
            }
    }
    
    func configurePopUpView(with model: UserDistanceModel, completion: @escaping () -> Void) {
        popUpUserView.configurationCell(with: model)
        popUpUserView.cancelChoiseAction = {
            completion()
        }
    }
}
