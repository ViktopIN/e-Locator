//
//  MainPresenter.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, serviceContainer: ServiceContainerProtocol)
    var mainUserName: String { get set }
    func amountOfTableViewCell() -> Int
    func tableViewDataProvide() -> [UserDistanceModel]
    func fetchData()
}

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    private unowned var view: MainViewProtocol
    private var modelInteractor: UserDistanceModelInteractorProtocol
    private var locationService: LocationServiceProtocol
    private var networkService: NetworkServiceProtocol
    private var requester: RequesterProtocol
    
    private var model: [UserDistanceModel]?
    
    lazy var mainUserName: String = "Вас"
    
    // MARK: - Initialiser
    
    required init(
        view: MainViewProtocol,
        serviceContainer: ServiceContainerProtocol
    ) {
        self.view = view
        modelInteractor = serviceContainer.interactorService
        locationService = serviceContainer.locationService
        networkService = serviceContainer.networkService
        requester = serviceContainer.requesterService
        
        presenterConfiguration()
    }
        
    // MARK: - Methods
    
    private func presenterConfiguration() {
        locationService.delegate = self
        requester.action = { [unowned self] in
            fetchData()
        }
    }
    
    func amountOfTableViewCell() -> Int {
        model?.count ?? 0
    }
    
    func tableViewDataProvide() -> [UserDistanceModel] {
        model ?? []
    }
    
    func fetchData() {
        // Make pseudo URL for mock service
        let url = URL(filePath: "url")
        
        locationService.start()
        networkService.loadData(from: url) { [unowned self] (result: Result<[MockUserLocationModel], Error>) in
            switch result {
            case .success(let success):
                self.model = modelInteractor.providePreparedModel(
                    mainUserName: mainUserName,
                    mainUserLocation: locationService.currentUserLocation,
                    unpreparedModel: success
                )
                view.reloadMainTableView()
            case .failure(let failure):
                view.networkError(failure.localizedDescription)
            }
        }
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
