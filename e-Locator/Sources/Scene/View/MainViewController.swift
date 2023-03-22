//
//  MainViewController.swift
//  e-Locator
//
//  Created by Виктор on 17.03.2023.
//

import UIKit
import SnapKit

protocol MainViewProtocol: AnyObject {
    func reloadMainTableView()
    func locationServicesRestrictedState()
    func locationServicesNeededState()
    func promptForAuthorization()
    func switchOffIndicatorView()
    func networkError(_ errorDescription: String)
}

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
        
        setupView()
    }
    
    // MARK: - Settings
    
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
        
        let data = presenter.tableViewDataProvide()
        cell.configurationCell(with: data[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - Extenstions -

extension MainViewController: MainViewProtocol {
    func switchOffIndicatorView() {
        mainView.switchOffIndicatorView()
    }
    
    func promptForAuthorization() {
        DispatchQueue.main.async { [unowned self] in
            let alert = UIAlertController(
                title: "Location access is needed to get your current location",
                message: "Please allow location access",
                preferredStyle: .alert
            )
            let settingsAction = UIAlertAction(
                title: "Settings",
                style: .default,
                handler: { _ in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                          options: [:], completionHandler: nil
                )
            })

            let cancelAction = UIAlertAction(
                title: "Cancel",
                style: .default,
                handler: { [unowned self] _ in
                locationServicesNeededState()
            }
            )

            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
                  
            alert.preferredAction = settingsAction

            present(alert, animated: true, completion: nil)
        }
    }
    
    func networkError(_ errorDescription: String) {
        DispatchQueue.main.async { [unowned self] in
            let alert = UIAlertController(
                title: "Something wrong with network service.\n\(errorDescription)",
                message: "Please check network setup",
                preferredStyle: .alert
            )
            let cancelAction = UIAlertAction(title: "Cancel", style: .default)

            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
    }

    func locationServicesNeededState() {
        DispatchQueue.main.async { [unowned self] in
            mainView.mainTableView.isHidden = true
            mainView.statusLabel.isHidden = false
            mainView.statusLabel.text = "Access to location services is needed."
        }
    }
    
    func locationServicesRestrictedState() {
        DispatchQueue.main.async { [unowned self] in
            mainView.mainTableView.isHidden = true
            mainView.statusLabel.isHidden = false
            mainView.statusLabel.text = "The app is restricted from using the location services."
        }
    }
    
    func reloadMainTableView() {
        DispatchQueue.main.async { [unowned self] in 
            mainView.mainTableView.reloadData()
        }
    }
}

