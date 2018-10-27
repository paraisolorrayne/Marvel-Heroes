//
//  RequestAdapter.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation
import UIKit

class RequestAdapter {
    static func request<T: Decodable>(_ url: URL, _ onComplete: @escaping (Result<T>) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, _, requestError) in
            if let requestError = requestError {
                return onComplete(.failure(requestError))
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                onComplete(.success(response))
            } catch {
                onComplete(.failure(error))
            }
        }
        task.resume()
    }
}
