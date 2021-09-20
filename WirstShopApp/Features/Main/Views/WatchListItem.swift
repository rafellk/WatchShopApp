//
//  WatchListItem.swift
//  WirstShopApp
//
//  Created by aluno on 20/09/21.
//

import SwiftUI

struct WatchListItem: View {
    
    let imageName: String
    let title: String
    let subtitle: String
    let price: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 93, height: 93)
                .padding(8)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom(Fonts.metropolisMedium.rawValue, size: 17))
                Text(subtitle)
                    .font(.custom(Fonts.metropolisBook.rawValue, size: 13))
            }
            .padding(.leading, 12)
            Spacer()
            Text("$\(price)")
                .font(.custom(Fonts.metropolisLight.rawValue, size: 24))
                .padding(.trailing, 8)
        }
        .background(Color("watch_item_background"))
    }
}

struct WatchListItem_Previews: PreviewProvider {
    static var previews: some View {
        WatchListItem(imageName: "ormous", title: "ORMOUS", subtitle: "White, size L", price: "249")
    }
}
