//
//  RatingForm.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/22.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct RatingForm: View {
    
    var category : String
    @Binding var sizeRating: Int
    @Binding var testReview: String
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(category)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                    RatingView(rating: $sizeRating)
                        .padding(.trailing)
                }
                TextField("Please fill in a descriptive review", text: $testReview)
                    .frame(width:380, height:100)
                    .lineLimit(nil)
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
            }
            
        }
    }
}

//struct RatingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingForm(sizeRating: <#Binding<Int>#>, testReview: <#Binding<String>#>)
//    }
//}
