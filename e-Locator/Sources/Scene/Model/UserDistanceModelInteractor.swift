//
//  UnitDistanceModelInteractor.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

class UserDistanceModelInteractor: UserDistanceModelInteractorProtocol {
    
    // MARK: - Methods
    
    func providePreparedModel() -> [UserDistanceModel] {
        UserDistanceModel.getModel()
    }
}
