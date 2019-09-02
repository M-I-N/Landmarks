//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {

    @Environment(\.editMode) var editMode
    @Environment(\.presentationMode) var presentationMode
    @State private var profile = Profile.default
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button(action: {
                        self.editMode?.wrappedValue = .inactive
                        self.draftProfile = self.profile
                        self.presentationMode.animation().wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
                Spacer()
                Button(action: {
                    self.profile = self.draftProfile
                    self.editMode?.animation().wrappedValue.toggle()
                }) {
                    Text(editMode?.wrappedValue == .inactive ? "Edit" : "Done").bold()
                }
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }

}

extension EditMode {
    mutating func toggle() {
        self = self == .active ? .inactive : .active
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
