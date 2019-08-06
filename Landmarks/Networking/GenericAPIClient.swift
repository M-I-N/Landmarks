//
//  GenericAPIClient.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol GenericAPIClient {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decoder: JSONDecoder, completion: @escaping (Result<T, APIError>) -> Void)
}

extension GenericAPIClient {

    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void

    private func decodingTask<T: Decodable>(with request: URLRequest, decoder: JSONDecoder, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { (data, response, error) in
            let errorDescription = error?.localizedDescription ?? "No Error description available"
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(description: errorDescription))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(nil, .responseUnsuccessful(statusCode: httpResponse.statusCode))
                return
            }
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            do {
                let genericModel = try decoder.decode(decodingType, from: data)
                completion(genericModel, nil)
            } catch {
                completion(nil, .jsonDecodingFailure(error: error))
            }
        }
        return task
    }

    func fetch<T: Decodable>(with request: URLRequest, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, APIError>) -> Void) {
        let task = decodingTask(with: request, decoder: decoder, decodingType: T.self) { (decodable, error) in
            DispatchQueue.main.async {
                guard let decodable = decodable as? T else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(decodable))
            }
        }
        task.resume()
    }

}
