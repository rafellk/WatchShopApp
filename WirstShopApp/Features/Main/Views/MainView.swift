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
        WatchModel(name: "ORMOUS", sizeDescription: "White, size L", price: "249", smallImageName: "ormous", bigImageName: "watch1"),
        WatchModel(name: "HISAKO", sizeDescription: "Black, size M", price: "329", smallImageName: "hisako", bigImageName: "watch2")
    ]
}

struct MainView: View {
    
    @Namespace var namespace
    @State var selectedModel: WatchModel?
    @State var detailHero = false
    
    var body: some View {
        ZStack {
            if detailHero, let model = selectedModel {
                WatchDetailView(model: model, namespace: namespace, hero: $detailHero)
            }
            
            GeometryReader { reader in
                VStack() {
                    CustomNavigationView(title: "Watches")
                        .padding(.bottom, 16)
                    ScrollView(showsIndicators: false) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<DataSource.models.count) { index in
                                    let model = DataSource.models[index]
                                    WatchCollectionListItem(imageName: model.bigImageName,
                                                            title: model.name,
                                                            price: model.price,
                                                            screenWidth: reader.size.width,
                                                            namespace: namespace)
                                        .padding(.trailing, index == DataSource.models.count - 1 ? 30 : 0)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                                selectedModel = model
                                                detailHero = true
                                            }
                                        }
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
                            ForEach(0..<DataSource.models.count) { index in
                                let model = DataSource.models[index]
                                WatchListItem(imageName: model.smallImageName, title: model.name, subtitle: model.sizeDescription, price: model.price)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 16)
                    }
                }
            }
            .opacity(detailHero ? 0 : 1)
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
            MainView()
                .previewDevice("iPhone SE (2nd generation)")

        }
    }
}
