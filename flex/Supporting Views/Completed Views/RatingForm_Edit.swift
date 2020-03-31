//
//  RatingForm.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/22.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct RatingForm_Edit: View {
    
    var category : String
    @Binding var sizeRating: Int
    @Binding var testReview: String
    
    @State var categoryChoice = 0
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var settings = ["사이즈", "디자인", "착화감", "가격대비", "활용성","기타"]
    
    var body: some View {
        HStack {
            VStack {
                
                VStack {
                    
                    Picker("Category", selection: $categoryChoice) {
                        ForEach(0 ..< settings.count) { index in
                            Text(self.settings[index])
                                .tag(index)
                        }

                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Spacer()
                    RatingView(rating: $sizeRating)
                        .padding(.leading)
                        .padding(.top,10)
                }
                Spacer()
                TextField("Please fill in a descriptive review", text: $testReview)
                    .frame(width:380, height:200)
                    .lineLimit(nil)
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
//                    .padding(.leading, 20)
            }
            
        }
    }
}

//struct RatingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingForm(sizeRating: <#Binding<Int>#>, testReview: <#Binding<String>#>)
//    }
//}
