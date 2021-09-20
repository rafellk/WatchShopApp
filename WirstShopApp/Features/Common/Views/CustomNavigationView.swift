//
//  CustomNavigationView.swift
//  WirstShopApp
//
//  Created by Rafael Lucena on 20/09/21.
//

import SwiftUI

struct CustomNavigationView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Image("menu")
            Spacer()
            Text(title)
                .font(.custom(Fonts.metropolisBook.rawValue, size: 17))
            Spacer()
            Image("search")
        }
        .padding(.horizontal, 30)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(title: "Watches")
    }
}
