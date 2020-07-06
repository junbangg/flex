//
//  UsersItems.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct UserOutfits: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        NeuromorphicOutfit(image: Image("outfit"), brand: "testing", product: "가을아 와라")
                        NeuromorphicOutfit(image: Image("outfitTwo"), brand: "데일리룩", product: "덥다")
                    }

                }
                .frame(width: geometry.size.width)
//                    .padding(.top,30)
            }
            .background(Color.white)
        
        }
    }
}

struct UserOutfits_Previews: PreviewProvider {
    static var previews: some View {
        UserOutfits()
    }
}
