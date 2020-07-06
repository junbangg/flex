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
                .frame(width:100, height:100)
//            Text(brand)
//                .font(.title)
//                .padding(.top,5)
            Text(brand)
                .padding(.top,5)
            Text(product)
                .font(.caption)
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
