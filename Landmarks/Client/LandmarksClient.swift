//
//  LandmarksClient.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Combine

class LandmarksClient: GenericAPIClient, ObservableObject {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetchLandmarks(from landmarksEndpoint: LandmarksEndpoint, completion: @escaping (Result<LandmarksResponse, APIError>) -> Void) {
        fetch(with: landmarksEndpoint.request, decoder: JSONDecoder(), completion: completion)
    }
}

struct LandmarksEndpoint: Endpoint {

    let base: String = "https://gist.githubusercontent.com"
    let path: String = "/M-I-N/ad6d4fa43ca87389f5d090b4be248aca/raw/67ae1b83fedd447bafeb7c92bcf396cfc2208b6e/Landmarks.json"

}

struct LandmarksResponse: Decodable {
    let landmarks: [Landmark]
}
