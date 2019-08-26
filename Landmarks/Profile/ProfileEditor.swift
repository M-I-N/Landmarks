//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {

    @Binding var profile: Profile

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.userName)
            }

            VStack(alignment: .leading) {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
