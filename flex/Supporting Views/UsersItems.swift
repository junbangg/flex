//
//  UsersItems.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct UsersItems: View {
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
//                    ReviewCardFour()
//                    ReviewCardFour()
//                        .padding(.top, 15)
//                    ReviewCardFour()
//                        .padding(.top, 15)
//                    ReviewCardFour()
//                        .padding(.top, 15)
//                    ReviewCardFour()
//                        .padding(.top, 15)
//                    ReviewCardFour()
//                        .padding(.top, 15)
//                    ReviewCardFour()
//                        .padding(.top, 15)
                    
                    ReviewCard()
                        .padding(.top, 10)
                    ReviewCard()
                        .padding(.top, 15)
                    ReviewCard()
                        .padding(.top, 15)
                    ReviewCard()
                        .padding(.top, 15)
                    ReviewCard()
                        .padding(.top, 15)
                    ReviewCard()
                        .padding(.top, 15)
                    ReviewCard()
                        .padding(.top, 15)
                    
                    NavigationLink(destination: NewReview()) {
                        AddCard()
                            .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
                            .padding(.top, 60.0)
                            .padding(.bottom, 60)
                    }
                }.frame(width: geometry.size.width)
                    .padding(.top,30)
            }
        }
    }
}

struct UsersItems_Previews: PreviewProvider {
    static var previews: some View {
        UsersItems()
    }
}
