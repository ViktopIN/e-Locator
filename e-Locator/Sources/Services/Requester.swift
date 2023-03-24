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
    func start()
}

final class Requester: RequesterProtocol {
    
    // MARK: - Properties
    
    private var timer: Timer?
    private var timeInterval: TimeInterval
    var action: (() -> Void)?
    
    // MARK: - Init
    
    init(timeInterval: Double) {
        self.timeInterval = timeInterval
        start()
    }
    
    // MARK: - Method
    @objc
    private func fireAction() {
        guard let action = action else { return }
        action()
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func start() {
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
}
