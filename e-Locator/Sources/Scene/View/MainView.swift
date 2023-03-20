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
    
    // MARK: - Views
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView = UIView(background: .clear)
            
    private var mainTableView: UITableView = {
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
        
    }
                
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(mainScrollView)
        mainScrollView.addSubview(containerView)
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
    }
    
    private func setupView() {
        backgroundColor = .mainBackgroundColor
        mainTableView.rowHeight = tableViewRowHeight
    }
    
    // MARK: - Methods
    
    func mainTableViewDataSource(_ dataSource: UITableViewDataSource) {
        mainTableView.dataSource = dataSource
    }
    
    func mainTableViewDelegate(_ delegate: UITableViewDelegate) {
        mainTableView.delegate = delegate
    }
}
