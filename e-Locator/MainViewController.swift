//
//  MainViewController.swift
//  e-Locator
//
//  Created by Виктор on 17.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Views
    
    let mainView = MainView(frame: .zero)

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

