//
//  LocationManager.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import CoreLocation
import CoreMotion

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()

    // MARK: - Initialiser
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
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
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        case .authorized:
            break
        @unknown default:
            break
        }
    }
}
