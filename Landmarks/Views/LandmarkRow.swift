//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 7/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    let landmark: Landmark
    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.orange)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
    }
}
#endif
