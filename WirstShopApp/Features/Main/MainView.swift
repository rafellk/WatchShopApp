//
//  MainView.swift
//  WirstShopApp
//
//  Created by Rafael Lucena on 20/09/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { reader in
            VStack() {
                CustomNavigationView(title: "Watches")
                    .padding(.bottom, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        Image("watch1")
                            .frame(width: reader.size.width * 0.75)
                            .padding(.leading, 30)
                        Image("watch2")
                            .frame(width: reader.size.width * 0.75)
                            .padding(.leading, 30)
                    }
                    .frame(height: (reader.size.width * 0.75) * 1.14)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 12 Pro")
            MainView()
                .previewDevice("iPhone 8")
        }
    }
}
