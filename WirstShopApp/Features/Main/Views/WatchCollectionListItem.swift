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
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: title, in: namespace)
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
