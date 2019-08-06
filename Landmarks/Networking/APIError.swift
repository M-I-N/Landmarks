//
//  APIError.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum APIError: Error {

    case invalidData
    case jsonDecodingFailure(error: Error)
    case responseUnsuccessful(statusCode: Int)
    case requestFailed(description: String)
    case postParametersEncodingFalure(description: String)

    var customDescription: String {
        switch self {
        case .invalidData: return "APIError - Invalid Data"
        case .jsonDecodingFailure(let error) : return "APIError - JSON decoding Failure -> \(error)"
        case .responseUnsuccessful(let statusCode): return "APIError - Response Unsuccessful status code -> \(statusCode)"
        case .requestFailed(let description): return "APIError - Request Failed -> \(description)"
        case .postParametersEncodingFalure(let description): return "APIError - post parameters failure -> \(description)"
        }
    }
}
