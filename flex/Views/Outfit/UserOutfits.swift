//
//  UsersItems.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct UserOutfits: View {
    @Binding var isNavBarHidden : Bool
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Outfit(image: Image("outfit"), brand: "testing", product: "가을아 와라", isNavBarHidden: self.$isNavBarHidden)
                        Outfit(image: Image("outfitTwo"), brand: "데일리룩", product: "덥다", isNavBarHidden: self.$isNavBarHidden)
                    }

                }
                .frame(width: geometry.size.width)
//                    .padding(.top,30)
            }
            .background(Color.white)
        
        }
    }
}

//struct UserOutfits_Previews: PreviewProvider {
//    static var previews: some View {
//        UserOutfits()
//    }
//}
