//
//  Double+Extension.swift
//  e-Locator
//
//  Created by Виктор on 22.03.2023.
//

import Foundation

extension Double {
    func distanceDescription(fromUser name: String) -> String {
        if self > 1000 {
            return "\(Int(self) % 1000) км от \(name)"
        } else {
            return "\(Int(self)) м от \(name)"
        }
    }
}
