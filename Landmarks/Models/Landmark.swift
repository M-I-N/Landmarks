//
//  Landmark.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 7/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Identifiable {
    let id: Int
    let name: String
    private let imageName: String
    private let coordinates: Coordinates
    let state: String
    let park: String
    let category: Category
    var isFavorite: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    func image(forSize size: Int) -> Image {
        return ImageStore.shared.image(name: imageName, size: size)
    }

    struct Coordinates: Codable {
        let latitude: Double
        let longitude: Double
    }
    enum Category: String, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
