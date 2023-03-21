//
//  MainPresenter.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    private unowned var view: MainViewProtocol
    private var modelInteractor: UserDistanceModelInteractorProtocol
    private var locationService: LocationService
    
    // MARK: - Initialiser
    
    required init(view: MainViewProtocol) {
        self.view = view
        modelInteractor = UserDistanceModelInteractor()
        locationService = LocationService()
        locationService.delegate = self
    }
    
    // MARK: - Methods
    
    func amountOfTableViewCell() -> Int {
        modelInteractor.providePreparedModel().count
    }
    
    func tableViewDataProvide() -> [UserDistanceModel] {
        modelInteractor.providePreparedModel()
    }
}

// MARK: - Extensions

extension MainPresenter: LocationServiceDelegate {
    func authorizationRestricted() {
        view.locationServicesRestrictedState()
    }
    
    func authorizationUnknown() {
        view.locationServicesNeededState()
    }
    
    func promptAuthorizationAction() {
        view.promptForAuthorization()
    }
    
    func didAuthorize() {
        locationService.start()
    }
}
