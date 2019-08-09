//
//  UserData.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 7/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {

    @Published var showFavoritesOnly = false
    @Published var landmarks = [Landmark]()
    @Published var isFetchInProgress = false
    @Published var showUserProfile = false

    private let client: LandmarksClient

    init(client: LandmarksClient) {
        self.client = client
    }

    var categories: [String: [Landmark]] {
        .init(grouping: landmarks) { $0.category.rawValue }
    }

    var featured: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }

    func fetch() {
        isFetchInProgress = true
        client.fetchLandmarks(from: LandmarksEndpoint()) { [weak self] result in
            self?.isFetchInProgress = false
            switch result {
            case .success(let landmarksResponse):
                self?.landmarks = landmarksResponse.landmarks
            case .failure(let error):
                print(error.customDescription)
                self?.landmarks = []
            }
        }
    }

}
