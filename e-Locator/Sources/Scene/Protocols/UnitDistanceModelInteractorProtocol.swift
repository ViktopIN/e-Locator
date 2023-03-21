//
//  UnitDistanceModelInteractorProtocol.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol UnitDistanceModelInteractorProtocol: AnyObject {
    func providePreparedModel() -> [UnitDistanceModel]
}
