//
//  MainPresenter.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    private weak var view: MainViewProtocol?
    private weak var modelInteractor: UserDistanceModelInteractorProtocol!
    
    // MARK: - Initialiser
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func amountOfTableViewCell() -> Int {
        modelInteractor.providePreparedModel().count
    }
    
    func tableViewDataProvide() -> [UserDistanceModel] {
        modelInteractor.providePreparedModel()
    }
}
