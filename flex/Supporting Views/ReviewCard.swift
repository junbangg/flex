//
//  ReviewCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewCard: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "flame")
                    .foregroundColor(Color.red)
                    .font(.system(size: 20, weight: .medium))
                Text("534")
                .font(.headline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
            }
            .offset(x:-30, y:-50)
            
            
            CircleImage(image: Image("sacai") )
                .frame(width: 136, height: 136)
            .offset(x:-30)
//                .padding(.trailing, 50)
            
            VStack {
                Text("Nike")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("LDV Waffle")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.green)
                        .font(.system(size: 30, weight: .medium))
                    Text("8.5")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.yellow)
                    
                }
            }
            
        }.overlay(
            Rectangle()
                .fill(Color.clear)
                .border(Color.gray, width: 4)
                .frame(width: 380, height: 150)
        )
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard()
    }
}

