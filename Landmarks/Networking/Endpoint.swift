//
//  Endpoint.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol Endpoint {

    /// The base URL of the resource as String. Don't return any path component after the domain name. Ex. https://baseurl.com
    var base: String { get }

    /// Path of the Endpoint. Ex. /resource/path
    var path: String { get }
}

extension Endpoint {

    private var urlComponents: URLComponents? {
        guard var components = URLComponents(string: base) else { return nil }
        components.path = path
        return components
    }

    var request: URLRequest {
        let url = urlComponents?.url ?? URL(string: "\(base)\(path)")!
        let request = URLRequest(url: url)
        return request
    }

}
