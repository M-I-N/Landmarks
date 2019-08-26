//
//  Home.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var userData: UserData

    var userProfileButton: some View {
        Button(action: {
            self.userData.showUserProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle.fill")
            .imageScale(.large)
        }
    }

    var body: some View {
        ActivityIndicatorView(isShowing: $userData.isFetchInProgress) {
            NavigationView {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        if self.userData.landmarks.count > 0 {

                            FeaturedLandmarks(landmarks: self.userData.featured)
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .listRowInsets(EdgeInsets())

                            ForEach(self.userData.categories.keys.sorted(), id: \.self) { key in
                                CategoryRow(categoryName: key, items: self.userData.categories[key]!)
                            }
                            .listRowInsets(EdgeInsets())

                            NavigationLink(destination: LandmarkList()) {
                                Text("See All")
                            }

                        }
                    }
                }
                .navigationBarTitle("Featured")
                .navigationBarItems(trailing: self.userProfileButton)
                .sheet(isPresented: self.$userData.showUserProfile) {
                        ProfileHost()
                }
            }
        }
        .onAppear {
            self.userData.fetch()
        }
    }
}

struct FeaturedLandmarks: View {
    let landmarks: [Landmark]
    var body: some View {
        landmarks[0].image
        .resizable()
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
