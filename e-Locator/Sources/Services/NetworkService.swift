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
    private let session: URLSession
    
    // By using a default argument (in this case .shared) we can add dependency
    // injection without making our app code more complicated.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
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
