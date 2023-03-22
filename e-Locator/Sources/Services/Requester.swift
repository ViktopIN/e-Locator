//
//  Requester.swift
//  e-Locator
//
//  Created by Виктор on 22.03.2023.
//

import Foundation

protocol RequesterProtocol {
    init(timeInterval: Double)
    var action: (() -> Void)? { get set }
    func stop()
}

final class Requester: RequesterProtocol {
    
    // MARK: - Properties
    
    private var timer: Timer?
    var action: (() -> Void)?
    
    // MARK: - Init
    
    init(timeInterval: Double) {
        timer = Timer(
            timeInterval: TimeInterval(timeInterval),
            target: self,
            selector: #selector(fireAction),
            userInfo: nil,
            repeats: true
        )
        guard let timer = timer else { return }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    // MARK: - Method
    @objc
    private func fireAction() {
        guard let action = action else { return }
        action()
    }
    
    func stop() {
        timer?.invalidate()
    }
}
