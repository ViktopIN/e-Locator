//
//  UnitDistanceModel.swift
//  e-Locator
//
//  Created by Виктор on 20.03.2023.
//

import UIKit

struct UserDistanceModel: Equatable {
    let name: String
    let image: UIImage?
    let id: String
    let distanceDescription: String
    
    static func == (lhs: UserDistanceModel, rhs: UserDistanceModel) -> Bool {
           return
               lhs.id == rhs.id 
       }
}
