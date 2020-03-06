//
//  ReviewCardTwo.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewCardTwo: View {
    var body: some View {
        HStack {
            
            //            .offset(x:-30, y:-50)
            
            CircleImage(image: Image("sacai") )
                .frame(width: 136, height: 136)
                .offset(x:-20)
            //                .padding(.trailing, 50)
            
            VStack {
                Text("Nike")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5 )
                Text("LDV Waffle")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .offset(x:-10)
            VStack {
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.green)
                        .font(.system(size: 30, weight: .medium))
                    Text("8.5")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.yellow)
                }
                HStack {
                    Image(systemName: "flame")
                        .foregroundColor(Color.red)
                        .font(.system(size: 30, weight: .medium))
                    Text("534")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.yellow)
                }
                .offset(x:5 )
            }
            .offset(x:5)
            
            
            
        }.overlay(
            Rectangle()
                .fill(Color.clear)
                .border(Color.gray, width: 4)
                .frame(width: 400, height: 160)
        )
    }
}

struct ReviewCardTwo_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCardTwo()
    }
}
