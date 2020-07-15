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
                    //Dummy data
                    HStack(spacing:20) {
                        
                        Review(image: Image("sacai"), brand: "Sacai x Nike", product: "LD Waffle")
                        
                        
                        
                        Review(image: Image("acw"), brand: "ACW x Nike", product: "Zoom Vomero 5")
                    }
                    .padding(.top,10)
                    HStack(spacing:20) {
                        
                        Review(image: Image("0"), brand: "Ader Error", product: "Color Block Jacket")
                        
                        Review(image: Image("4"), brand: "Nike", product: "Silver Bullet")
                    }
                    .padding(.top,10)
                    HStack(spacing:20) {
                        
                        Review(image: Image("3"), brand: "Acne Studios", product: "Denim Jacket")
                        
                        Review(image: Image("5"), brand: "New Balance", product: "990v4")
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
