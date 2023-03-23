//
//  MainTableViewCell.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MainTableViewCell"
    
    // MARK: - Views
    
    private lazy var cellContentView = UserInfoCellView()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(cellContentView)
    }
    
    private func setupLayout() {
        cellContentView.fillSuperview()
    }
    
    // MARK: - Methods
    
    func configurationCell(with data: UserDistanceModel) {
        cellContentView.configurationCell(with: data)
    }
}
