//
//  NeuromorphicCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct NeuromorphicCard: View {
    var image: Image
    var brand: String
    var product: String
    
    var body: some View {
        VStack(spacing:12) {
            CircleImage(image: image)
                .frame(width:120, height:120)
//            Text(brand)
//                .font(.title)
//                .padding(.top,5)
            Text(brand)
                .padding(.top,5)
            Text(product)
                .font(.caption)
            HStack(spacing: 5) {
                HStack {
                    Image(systemName: "flame")
                        .foregroundColor(Color.red)
                        .font(.system(size: 15, weight: .medium))
                    Text("533")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fixedSize()
                        .frame(width:20)
                        .foregroundColor(Color.gray)
                        .offset(y:1)
                }
                .padding(.horizontal)
//                Spacer()
                HStack {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .foregroundColor(Color.black)
                        .font(.system(size: 10, weight: .medium))
                        .offset(y:2)
                    Text("2")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fixedSize()
                        .frame(width:20)
                        .foregroundColor(Color.gray)
                }
//                .padding(.horizontal)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 20, weight: .light))
                    
                    Text("8.5")
//                        .font(.title)
                        .fontWeight(.semibold)
                        .fixedSize()
                        .frame(width:15)
                        .foregroundColor(Color.blue)
                        .offset(y:1)
                }
                .padding(.horizontal)
                .offset(x:-5)
                
            }
            
//                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .frame(width:(UIScreen.main.bounds.width-60)/2)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
