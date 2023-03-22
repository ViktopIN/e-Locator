//
//  URLSessionDataTaskMock.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

final class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
