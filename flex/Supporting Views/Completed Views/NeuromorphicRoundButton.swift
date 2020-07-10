//
//  NeuromorphicRoundButton.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

//struct NeuromorphicRoundButton: View {
//    var body: some View {
//        Button(action: {
//            print("Button tapped")
//        }) {
//            Image(systemName: "flame.fill")
//                .foregroundColor(.red)
//        }
//        .buttonStyle(NeuromorhpicButtonStyle())
//    }
//}

struct NeuromorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth:4)
                                    .blur(radius: 4)
                                    .offset(x:2, y:3)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius :4)
                                .offset(x:-2,y:-2)
                                .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                        
                    } else {
                        Circle()
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    }
                }
                .frame(width:50,height:50)
                
        )
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

//struct NeuromorphicRoundButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NeuromorphicRoundButton()
//    }
//}
