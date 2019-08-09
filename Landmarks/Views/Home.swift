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

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true, content: {
                VStack {
                    if userData.landmarks.count > 0 {
                        FeaturedLandmarks(landmarks: userData.featured)
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .listRowInsets(EdgeInsets())
                        ForEach(userData.categories.keys.sorted(), id: \.self) { key in
                            CategoryRow(categoryName: key, items: self.userData.categories[key]!)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
            })
            .navigationBarTitle("Featured")
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
