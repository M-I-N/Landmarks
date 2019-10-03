//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 7/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject private var userData: UserData
    let landmark: Landmark

    private var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        withAnimation { self.userData.landmarks[self.landmarkIndex].isFavorite.toggle() }
                    }) {
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                            .foregroundColor(self.userData.landmarks[self.landmarkIndex].isFavorite ? .orange : .gray)
                            .rotationEffect(.degrees(self.userData.landmarks[self.landmarkIndex].isFavorite ? 360 : 0))
                    }
                }
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData(client: LandmarksClient())
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)

    }
}
#endif
