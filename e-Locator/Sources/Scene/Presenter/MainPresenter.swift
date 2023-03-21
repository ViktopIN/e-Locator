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
    private var modelInteractor: UserDistanceModelInteractorProtocol?
    
    // MARK: - Initialiser
    
    required init(
        view: MainViewProtocol,
        modelInteractor: UserDistanceModelInteractorProtocol
    ) {
        self.view = view
        self.modelInteractor = modelInteractor
    }
    
    // MARK: - Methods
    
    func amountOfTableViewCell() -> Int {
        modelInteractor?.providePreparedModel().count ?? 0
    }
    
    func tableViewDataProvide() -> [UserDistanceModel]? {
        modelInteractor?.providePreparedModel()
    }
}
