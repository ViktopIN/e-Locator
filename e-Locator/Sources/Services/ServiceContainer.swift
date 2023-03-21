//
//  ServiceContainer.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol ServiceContainerProtocol: AnyObject {
    var networkService: NetworkServiceProtocol { get }
    var interactorService: UserDistanceModelInteractorProtocol { get }
    var locationService: LocationServiceProtocol { get }
}

final class ServiceContainer: ServiceContainerProtocol {
    
    // MARK: - Properties
    
    var networkService: NetworkServiceProtocol
    
    var interactorService: UserDistanceModelInteractorProtocol
    
    var locationService: LocationServiceProtocol
    
    // MARK: - Init
    
    init(
        networkService: NetworkServiceProtocol,
        interactorService: UserDistanceModelInteractorProtocol,
        locationService: LocationServiceProtocol
    ) {
        self.networkService = networkService
        self.interactorService = interactorService
        self.locationService = locationService
    }
}

