//
//  MainViewProtocol.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func reloadMainTableView()
    func locationServicesRestrictedState()
    func locationServicesNeededState()
    func promptForAuthorization()
}
