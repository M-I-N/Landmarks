//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 7/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        List {
            if self.userData.landmarks.count > 0 {
                Toggle(isOn: self.$userData.showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(self.userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData(client: LandmarksClient())
        return LandmarkList()
            .environmentObject(userData)
    }
}
#endif
