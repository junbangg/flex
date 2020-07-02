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
                    NavigationLink(destination: ReviewCard_Edit()) {
                        AddCard()
                            .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
                            .padding(.top, 30.0)
                            .padding(.bottom, 50)
                    }
                    
                    OutfitCard()
                        .padding(.top, 15)
                    OutfitCardTwo()
                        .padding(.top, 15)

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
