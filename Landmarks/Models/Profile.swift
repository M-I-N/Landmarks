//
//  Profile.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct Profile {
    var userName: String
    var seasonalPhoto: Season

    static let `default` = Profile(userName: "nayem_nil", seasonalPhoto: .summer)

    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
