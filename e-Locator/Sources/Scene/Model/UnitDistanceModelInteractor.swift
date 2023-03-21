//
//  UnitDistanceModelInteractor.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

class UnitDistanceModelInteractor: UnitDistanceModelInteractorProtocol {
    
    // MARK: - Methods
    
    func providePreparedModel() -> [UnitDistanceModel] {
        UnitDistanceModel.getModel()
    }
}
