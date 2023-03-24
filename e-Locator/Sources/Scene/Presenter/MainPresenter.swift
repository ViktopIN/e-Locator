//
//  MainPresenter.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import CoreLocation
import UIKit

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, serviceContainer: ServiceContainerProtocol)
    var mainUserName: String { get set }
    var mainId: String? { get set }
    func amountOfTableViewCell() -> Int
    func tableViewDataProvide() -> [UserDistanceModel]
    func mainModelRecieve() -> UserDistanceModel
    func updateDataForTableView()
    func defineSelectedCell(withId: String?) -> Bool
}

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    private unowned var view: MainViewProtocol
    private var modelInteractor: UserDistanceModelInteractorProtocol
    private var locationService: LocationServiceProtocol
    private var networkService: NetworkServiceProtocol
    private var requester: RequesterProtocol
    
    private var model: [UserDistanceModel]?
    private var unprepairedModel: [MockUserLocationModel]?
    
    var mainUserName: String = "Вас"
    var mainId: String? {
        willSet {
            if newValue == nil {
                mainUserName = "Вас"
            }
        }
    }
    var mainLocation: CLLocation?
    
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
    
    func mainModelRecieve() -> UserDistanceModel {
        requester.stop()
        let returnedModel = model?.first(where: { model in
            model.id == self.mainId
        })
        requester.start()
        return returnedModel ?? UserDistanceModel(
            name: "User",
            image: UIImage(), id: "",
            distanceDescription: "unknown distance"
        )
    }
    
    func updateDataForTableView() {
        updateMainLocation()
        self.model = modelInteractor.providePreparedModel(
            mainUserName: mainUserName,
            mainUserLocation: mainLocation,
            unpreparedModel: unprepairedModel
        )
        view.reloadMainTableView(valideData: false)
    }
    
    func defineSelectedCell(withId: String?) -> Bool {
        mainId == withId
    }
    
    private func updateMainLocation() {
        if let id = mainId,
           let unprepairedModel = unprepairedModel {
            let model = unprepairedModel.first { fetchingModel in
                fetchingModel.id == id
            }
            mainLocation = CLLocation(
                latitude: model!.latitude,
                longitude: model!.longtitude
            )
            locationService.stop()
        } else {
            locationService.start()
            mainLocation = locationService.currentUserLocation
        }
    }
    
    private func fetchData() {
        // Make pseudo URL for mock service
        let url = URL(filePath: "url")
        
        networkService.loadData(from: url) { [unowned self] (result: Result<[MockUserLocationModel], Error>) in
            switch result {
            case .success(let success):
                unprepairedModel = success
                updateMainLocation()
                
                self.model = modelInteractor.providePreparedModel(
                    mainUserName: mainUserName,
                    mainUserLocation: mainLocation,
                    unpreparedModel: success
                )
                if model == [] {
                    view.networkErrorRealise("Wrong data")
                }
                view.switchIndicatorView(to: false)
                view.reloadMainTableView(valideData: true)
            case .failure(let failure):
                view.networkErrorRealise(failure.localizedDescription)
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
