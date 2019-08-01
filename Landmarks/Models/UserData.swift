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
    @Published var landmarks = landmarkData

}
