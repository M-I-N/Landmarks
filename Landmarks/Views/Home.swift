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

                            Divider().padding(.leading)

                            ForEach(self.userData.categories.keys.sorted(), id: \.self) { key in
                                VStack {
                                    CategoryRow(categoryName: key, items: self.userData.categories[key]!)
                                    Divider().padding(.leading)
                                }
                            }

                            NavigationLink(destination: LandmarkList()) {
                                VStack {
                                    HStack {
                                        Text("See All")
                                            .font(.headline)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .imageScale(.medium)
                                    }
                                    .padding(.trailing)
                                    .foregroundColor(.primary)
                                    Divider()
                                }
                                .padding(.leading)
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
