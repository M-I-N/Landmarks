//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    let items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
                .padding(15)
            }
            .frame(height: 225)
        }
    }
}

struct CategoryItem: View {
    let landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.horizontal, 0)
        }
        .frame(width: 155)
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData(client: LandmarksClient())
        return CategoryRow(categoryName: userData.landmarks[0].category.rawValue, items: userData.landmarks)
    }
}
#endif
