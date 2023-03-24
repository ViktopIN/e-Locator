//
//  NetworkService.swift
//  e-Locator
//
//  Created by Виктор on 21.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    init(session: URLSession)
    func loadData<T: Codable>(
        from url: URL,
        completionHandler: @escaping (Result<[T], Error>) -> Void
    )
}

final class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Property
    
    private let session: URLSession
    
    // MARK: - Init
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Method
    
    func loadData<T: Codable>(
        from url: URL,
        completionHandler: @escaping (Result<[T], Error>) -> Void
    ) {
        let task = session.dataTask(with: url) { data, _, error in
            do {
                guard let data = data else { return }
                let convertedData = try JSONDecoder().decode([T].self, from: data)
                completionHandler(.success(convertedData))
            } catch {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
