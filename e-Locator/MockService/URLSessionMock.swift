//
//  URLSessionMock.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

final class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    // MARK: - Properties
    
    private var updaterService: any PseudoUpdaterServiceProtocol = MockModelPseudoUpaterService(handleArray: MockUserLocationModel.getModel())
    
    private var data: Data?
    private var error: Error?
        
    // MARK: - Override method

    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTask {
        let error = self.error
        let unpreparedData = updaterService.handledArray().map { item in
            return item as! MockUserLocationModel
        }
        do {
            let data = try JSONEncoder().encode(unpreparedData)
            print(String(data: data, encoding: .utf8)!)
            return URLSessionDataTaskMock {
                completionHandler(data, nil, error)
            }
        } catch {
                let data = self.data
                return URLSessionDataTaskMock {
                    completionHandler(data, nil, error)
            }
        }
    }
}
