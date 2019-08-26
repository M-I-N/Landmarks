//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    let profile: Profile

    var body: some View {
        List {
            Text(profile.userName)
                .bold()
                .font(.title)
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
