//
//  Landing.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct Landing: View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Text("Home")
                }
            VStack {
                Text("Search")
                Text("This screen will be implemented later")
                    .font(.subheadline)
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                    Text("Search")
                }
            VStack {
                Text("More")
                Text("This screen will be implemented later")
                    .font(.subheadline)
            }
                .tabItem {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                    Text("More")
                }
        }
        .font(.headline)
        .edgesIgnoringSafeArea(.top)

        .onAppear {
            self.userData.fetch()
        }
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
