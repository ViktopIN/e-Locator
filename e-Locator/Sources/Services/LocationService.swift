//
//  LocationService.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import CoreLocation
import CoreMotion

protocol LocationServiceDelegate: AnyObject {
    func authorizationRestricted()
    func authorizationUnknown()
    func promptAuthorizationAction()
    func didAuthorize()
}

protocol LocationServiceProtocol {
    var delegate: LocationServiceDelegate? { get set }
    var currentUserLocation: CLLocation? { get }
    func start()
    func stop()
}

final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    weak var delegate: LocationServiceDelegate?
    var currentUserLocation: CLLocation? {
        return locationManager.location
    }

    // MARK: - Initialiser
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    // MARK: - Methods
    
    func start() {
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .restricted:
            delegate?.authorizationRestricted()
        case .denied:
            delegate?.promptAuthorizationAction()
        case .authorizedAlways:
            delegate?.didAuthorize()
        case .authorizedWhenInUse:
            delegate?.didAuthorize()
        case .authorized:
            delegate?.didAuthorize()
        @unknown default:
            delegate?.authorizationUnknown()
        }
    }
}
