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
                    .padding(.bottom, 16)
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            WatchCollectionListItem(imageName: "watch1", title: "ORMOUS", price: "249", screenWidth: reader.size.width)
                        }
                        .frame(height: (reader.size.width * 0.75) * 1.14)
                    }
                    .padding(.bottom, 50)
                    
                    HStack {
                        Text("Discover")
                            .font(.custom(Fonts.metropolisSemiBold.rawValue, size: 20))
                        Spacer()
                        Rectangle()
                            .frame(width: 20, height: 2)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 24)
                    
                    VStack(spacing: 24) {
                        WatchListItem(imageName: "ormous", title: "ORMOUS", subtitle: "White, size L", price: "249")
                        WatchListItem(imageName: "hisako", title: "HISAKO", subtitle: "Black, size M", price: "329")
                    }
                    .padding(.horizontal, 30)
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
