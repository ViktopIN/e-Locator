//
//  MainPresenterProtocol.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, serviceContainer: ServiceContainerProtocol)
    func amountOfTableViewCell() -> Int
    func tableViewDataProvide() -> [UserDistanceModel]
}
