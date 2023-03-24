//
//  MockModelPseudoUpaterService.swift
//  e-Locator
//
//  Created by Виктор on 22.03.2023.
//

import Foundation

protocol PseudoUpdaterServiceProtocol {
    associatedtype ArrayItem
    init(handleArray: [ArrayItem])
    func handledArray() -> [ArrayItem]
}

final class MockModelPseudoUpaterService: PseudoUpdaterServiceProtocol {
    
    typealias ArrayItem = MockUserLocationModel
    
    // MARK: - Properties
    
    private var handleArray: [MockUserLocationModel]
    private var diapason = 0.007...0.012
    
    // MARK: - Init
    
    init(handleArray: [MockUserLocationModel]) {
        self.handleArray = handleArray
    }
    
    // MARK: - Methods
    
    func handledArray() -> [MockUserLocationModel] {
       let newHandledArray = handleArray.map { item in
           var newItem = item
           newItem.latitude += Double.random(in: diapason)
           newItem.longtitude += Double.random(in: diapason)
           return newItem
        }
        handleArray = newHandledArray
        return newHandledArray
    }
}

