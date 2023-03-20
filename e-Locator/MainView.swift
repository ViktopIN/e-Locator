//
//  MainView.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
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
            make.height.equalTo(mainTableView)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(800)
        }
    }
    
    private func setupView() {
        backgroundColor = .mainBackgroundColor
    }
    
    // MARK: - Methods
    
    func mainTableViewDataSource(_ dataSource: UITableViewDataSource) {
        mainTableView.dataSource = dataSource
    }
    
    func mainTableViewDelegate(_ delegate: UITableViewDelegate) {
        mainTableView.delegate = delegate
    }
}
