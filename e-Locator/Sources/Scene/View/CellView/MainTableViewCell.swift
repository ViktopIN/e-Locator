//
//  MainTableViewCell.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MainTableViewCell"
    var id: String?
    var recieveDataAction: ((_ id: String, _ name: String) -> ())?
    var cancelChoiseAction: (() -> Void)?
    
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
        contentView.addSubview(cellContentView)
    }
    
    private func setupLayout() {
        cellContentView.fillSuperview()
    }
    
    // MARK: - Methods
    
    func configurationCell(with data: UserDistanceModel) {
        id = data.id
        cellContentView.configurationCell(with: data)
    }
    
    func conectDataReciever() {
        guard let recieveDataAction = recieveDataAction,
              let cancelChoiseAction = cancelChoiseAction,
              let id = id
        else {
            return
            
        }
        cellContentView.recieveDataAction = { name in
            recieveDataAction(name, id)
        }
        
        cellContentView.cancelChoiseAction = {
            cancelChoiseAction()
        }
    }
    
    func configurationSelectCell(with value: Bool) {
        cellContentView.configureSelectMarkButton(is: value)
    }
}
