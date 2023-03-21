//
//  ModuleBuilderProtocol.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func moduleProvider() -> UIViewController
}
