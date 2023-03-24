//
//  MainModuleBuilder.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func moduleProvider() -> UIViewController
}

final class MainModuleBuilder: ModuleBuilderProtocol {
    static func moduleProvider() -> UIViewController {
        let session = URLSessionMock()
        let networkService = NetworkService(session: session)
        let interactorService = UserDistanceModelInteractor()
        let locationService = LocationService()
        let requesterService = Requester(timeInterval: 3)
        let serviceContainer = ServiceContainer(
            networkService: networkService,
            interactorService: interactorService,
            locationService: locationService,
            requesterService: requesterService
        )
        
        let viewController = MainViewController()
        let presenter = MainPresenter(
            view: viewController, 
            serviceContainer: serviceContainer
        )
        viewController.presenter = presenter
        
        return viewController
    }
}

