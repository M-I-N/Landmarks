//
//  ActivityIndicatorView.swift
//  Landmarks
//
//  Created by Mufakkharul Islam Nayem on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView<Content: View>: View {
    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if (!self.isShowing) {
                    self.content()
                } else {
                    self.content()
                        .disabled(true)
                        .blur(radius: 3)

                    VStack {
                        Text("Loading ...")
                        ActivityIndicator(style: .large)
                    }
                    .frame(width: geometry.size.width / 2.0, height: 200.0)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                }
            }
        }
    }
}

#if DEBUG
struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView(isShowing: .constant(true)) {
            NavigationView {
                Text("Hello World")
                    .navigationBarTitle(Text("List"), displayMode: .large)
            }
        }
    }
}
#endif
