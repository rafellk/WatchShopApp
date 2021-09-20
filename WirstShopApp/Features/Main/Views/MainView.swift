//
//  MainView.swift
//  WirstShopApp
//
//  Created by Rafael Lucena on 20/09/21.
//

import SwiftUI

struct WatchModel {
    let name: String
    let sizeDescription: String
    let price: String
    let smallImageName: String
    let bigImageName: String
}

struct DataSource {
    static let models = [
        WatchModel(name: "ORMOUS", sizeDescription: "White, size L", price: "249", smallImageName: "watch1", bigImageName: "ormous"),
        WatchModel(name: "HISAKO", sizeDescription: "Black, size M", price: "329", smallImageName: "watch2", bigImageName: "hisako")
    ]
}

struct MainView: View {
    var body: some View {
        GeometryReader { reader in
            VStack() {
                CustomNavigationView(title: "Watches")
                    .padding(.bottom, 16)
                ScrollView(showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<DataSource.models.count) { index in
                                let model = DataSource.models[index]
                                WatchCollectionListItem(imageName: model.smallImageName,
                                                        title: model.name,
                                                        price: model.price,
                                                        screenWidth: reader.size.width)
                                    .padding(.trailing, index == DataSource.models.count - 1 ? 30 : 0)
                            }
                        }
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
