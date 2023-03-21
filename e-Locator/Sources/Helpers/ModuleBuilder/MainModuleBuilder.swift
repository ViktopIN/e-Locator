//
//  MainModuleBuilder.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import UIKit

final class MainModuleBuilder: ModuleBuilderProtocol {
    static func moduleProvider() -> UIViewController {
        let viewController = MainViewController()
        let modelInteractor = UserDistanceModelInteractor()
        let presenter = MainPresenter(view: viewController, modelInteractor: modelInteractor)
        viewController.presenter = presenter
        return viewController
    }
}

