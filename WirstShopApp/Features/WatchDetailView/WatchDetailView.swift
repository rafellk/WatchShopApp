//
//  WatchDetailView.swift
//  WirstShopApp
//
//  Created by aluno on 20/09/21.
//

import SwiftUI

struct WatchDetailView: View {
    
    var model: WatchModel
    let namespace: Namespace.ID
    @State var animation = false
    @Binding var hero: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(model.bigImageName)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: model.name, in: namespace)
                    .frame(maxHeight: UIScreen.main.bounds.size.height * 0.61)
                    .clipped()
                    .padding(.bottom, 38)
                
                if animation {
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
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                Spacer()
            }
            .ignoresSafeArea(.container, edges: .top)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeInOut) {
                        animation = true
                    }
                }
            })
            VStack() {
                HStack {
                    Image(systemName: "chevron.left")
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    Spacer()
                }
                Spacer()
            }
            .onTapGesture {
                withAnimation {
                    animation = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        hero = false
                    }
                }
            }
        }
    }
}

struct WatchDetailView_Previews: PreviewProvider {
    
    struct ContainerView: View {
        @Namespace var namespace
        var body: some View {
            WatchDetailView(model: WatchModel(name: "ORMOUS",
                                              sizeDescription: "White, size L",
                                              price: "249",
                                              smallImageName: "ormous",
                                              bigImageName: "watch1"),
                            namespace: namespace,
                            hero: .constant(true))
        }
    }
    
    static var previews: some View {
        ContainerView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
