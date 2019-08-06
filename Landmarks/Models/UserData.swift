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

    private let client: LandmarksClient

    init(client: LandmarksClient) {
        self.client = client
    }

    func fetch() {
        client.fetchLandmarks(from: LandmarksEndpoint()) { [weak self] result in
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
