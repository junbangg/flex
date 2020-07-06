//
//  NeuromorphicRoundButton.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct NeuromorphicRectButton: View {
    var body: some View {
        Button(action: {
            print("Button tapped")
        }) {
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
        }
        .buttonStyle(NeuromorhpicRectButtonStyle())
    }
}

struct NeuromorhpicRectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray, lineWidth:4)
                                    .blur(radius: 4)
                                    .offset(x:2, y:3)
                                    .mask(Rectangle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                        .overlay(
                            Rectangle()
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius :4)
                                .offset(x:-2,y:-2)
                                .mask(Rectangle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                        
                    } else {
                        Rectangle()
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    }
                }
                
        )
    }
}

struct NeuromorphicRectButton_Previews: PreviewProvider {
    static var previews: some View {
        NeuromorphicRectButton()
    }
}
