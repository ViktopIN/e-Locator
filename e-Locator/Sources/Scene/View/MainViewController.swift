//
//  MainViewController.swift
//  e-Locator
//
//  Created by Виктор on 17.03.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
        
    // MARK: - Views
    
    private var mainView = MainView(frame: .zero)
    var presenter: MainPresenterProtocol!
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    private func setupView() {
        mainView.mainTableView.dataSource = self
        let titleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black]
        title = "e-Locator"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = titleAttribute
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numbersOfRows = presenter.amountOfTableViewCell()
        mainView.tableViewHeightConstraint.update(offset: mainView.tableViewRowHeight * CGFloat(numbersOfRows))
        return numbersOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier,for: indexPath) as! MainTableViewCell
        
        guard let data = presenter.tableViewDataProvide() else { return cell}
        cell.configurationCell(with: data[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - Extenstions -

extension MainViewController: MainViewProtocol {
    func reloadMainTableView() {
        DispatchQueue.main.async { [unowned self] in 
            mainView.mainTableView.reloadData()
        }
    }
}

