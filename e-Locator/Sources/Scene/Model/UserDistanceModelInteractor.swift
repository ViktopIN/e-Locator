//
//  UnitDistanceModelInteractor.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import UIKit
import CoreLocation

protocol UserDistanceModelInteractorProtocol: AnyObject {
    func providePreparedModel(
        mainUserName: String,
        mainUserLocation: CLLocation?,
        unpreparedModel: [MockUserLocationModel]?
    ) -> [UserDistanceModel]
}

final class UserDistanceModelInteractor: UserDistanceModelInteractorProtocol {

    // MARK: - Methods
    
    func providePreparedModel(
        mainUserName: String,
        mainUserLocation: CLLocation?,
        unpreparedModel: [MockUserLocationModel]?
    ) -> [UserDistanceModel] {
        guard let mainUserLocation = mainUserLocation,
              let unpreparedModel = unpreparedModel
        else {
            return []
        }
        let preparedModel = unpreparedModel.map { userModel in
            let userLocation = CLLocation(
                latitude: userModel.latitude,
                longitude: userModel.longtitude
            )
            let distanceDescription = Double(mainUserLocation.distance(from: userLocation)).distanceDescription(fromUser: mainUserName)
            let newUserModel = UserDistanceModel(
                name: userModel.name,
                image: UIImage(named: userModel.imageName),
                id: userModel.id,
                distanceDescription: distanceDescription
            )
            return newUserModel
        }
        return preparedModel
    }
}
