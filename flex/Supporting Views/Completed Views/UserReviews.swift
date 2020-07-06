//
//  UsersReviews.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct UserReviews: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack(spacing:20) {
                        
                        NeuromorphicCard(image: Image("sacai"), brand: "Sacai x Nike", product: "LD Waffle")
                        
                        NeuromorphicCard(image: Image("acw"), brand: "ACW x Nike", product: "Zoom Vomero 5")
                    }
                    .padding(.top,10)
                    HStack(spacing:20) {
                        
                        NeuromorphicCard(image: Image("0"), brand: "Ader Error", product: "Color Block Jacket")
                        
                        NeuromorphicCard(image: Image("5"), brand: "Acne Studios", product: "Denim Jacket")
                    }
                    .padding(.top,10)
                    
                    
                }
                .frame(width: geometry.size.width)
//                .padding(.top,30)
            }
            .background(Color.white)
            
        }
    }
}

struct UserReviews_Previews: PreviewProvider {
    static var previews: some View {
        UserReviews()
    }
}
