//
//  NeuromorphicRoundButton.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

//struct NeuromorphicRectButton: View {
//    var body: some View {
//        Button(action: {
//            print("Button tapped")
//        }) {
//            Image(systemName: "flame.fill")
//                .foregroundColor(.red)
//        }
//        .buttonStyle(NeuromorhpicRectButtonStyle())
//    }
//}

struct NeuromorphicRectButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(MyColors.ferrariRed)
                            .cornerRadius(8)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray, lineWidth:4)
                                    .cornerRadius(8)
                                    .blur(radius: 4)
                                    .offset(x:2, y:3)
                                    .mask(Rectangle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                        .overlay(
                            Rectangle()
                                .stroke(MyColors.ferrariRed, lineWidth: 8)
                                .cornerRadius(8)
                                .blur(radius :4)
                                .offset(x:-2,y:-2)
                                .mask(Rectangle().fill(LinearGradient(Color.clear, Color.black)))
                        )

                    } else {
                        Rectangle()
                            .fill(MyColors.ferrariRed)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    }
                }
                
//                .frame(width:50,height:35)
                    .frame(width:85,height:40)

        )
    }
}

//struct NeuromorphicRectButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NeuromorphicRectButton()
//    }
//}
