//
//  WatchDetailView.swift
//  WirstShopApp
//
//  Created by aluno on 20/09/21.
//

import SwiftUI

struct WatchDetailView: View {
    
    let model: WatchModel
    
    var body: some View {
            VStack(alignment: .leading) {
                Image(model.bigImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: UIScreen.main.bounds.size.width, minHeight: 100)
                    .clipped()
                    .padding(.bottom, 38)
                Spacer()
                
                Group {
                    Text(model.name)
                        .font(.custom(Fonts.metropolisMedium.rawValue, size: 24))
                        .padding(.bottom, 12)
                    Text("$\(model.price)")
                        .font(.custom(Fonts.metropolisLight.rawValue, size: 24))
                        .padding(.bottom, 20)
                    Text("Named after asteroid 6 0 9 4 (h i s a k o) is currently travelling through time and space.")
                        .font(.custom(Fonts.metropolisLight.rawValue, size: 16))
                        .padding(.bottom, 35)
                    HStack {
                        Button(action: {}, label: {
                            Text("BUY NOW")
                                .font(.custom(Fonts.metropolisMedium.rawValue, size: 14))
                        })
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color("buy_now_button_background"))
                        .foregroundColor(.white)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(.white)
                                .border(Color.gray, width: 0.2)
                            Image(systemName: "heart")
                        }
                    }
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 30)
            }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct WatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WatchDetailView(model: WatchModel(name: "ORMOUS",
                                          sizeDescription: "White, size L",
                                          price: "249",
                                          smallImageName: "ormous",
                                          bigImageName: "watch1"))
            .previewDevice("iPhone SE (2nd generation)")
    }
}
