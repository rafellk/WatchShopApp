//
//  WatchCollectionListItem.swift
//  WirstShopApp
//
//  Created by aluno on 20/09/21.
//

import SwiftUI

struct WatchCollectionListItem: View {
   
    let imageName: String
    let title: String
    let price: String
    let screenWidth: CGFloat
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable(capInsets: /*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/, resizingMode: .stretch)
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(title)
                        .font(.custom(Fonts.metropolisMedium.rawValue, size: 24))
                        .foregroundColor(.white)
                    Text("$\(price)")
                        .font(.custom(Fonts.metropolisLight.rawValue, size: 20))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding([.bottom, .leading], 30)
        }
        .frame(width: screenWidth * 0.75)
        .padding(.leading, 30)
    }
}

struct WatchCollectionListItem_Previews: PreviewProvider {
    static var previews: some View {
        WatchCollectionListItem(imageName: "watch1", title: "ORMOUR", price: "249", screenWidth: UIScreen.main.bounds.size.width)
    }
}
