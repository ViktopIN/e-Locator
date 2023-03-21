//
//  URLSessionMock.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    // MARK: - Properties

    var data: Data?
    var error: Error?
    
    // MARK: - Override method

    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTask {
        let data = self.data
        let error = self.error

        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}
