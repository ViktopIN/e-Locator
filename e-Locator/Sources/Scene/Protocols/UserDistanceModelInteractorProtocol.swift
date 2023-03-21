//
//  UserDistanceModelInteractorProtocol.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol UserDistanceModelInteractorProtocol: AnyObject {
    func providePreparedModel() -> [UserDistanceModel]
}
