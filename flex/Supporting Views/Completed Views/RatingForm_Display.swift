//
//  RatingForm.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/22.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct RatingForm_Display: View {
    
    var category : String
    @Binding var sizeRating: Int
    @Binding var testReview: String
    
    @State var categoryChoice = 0
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var settings = ["사이즈", "디자인", "착화감", "가격대비", "활용성","기타"]
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Sizing")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.blue)
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 30, weight: .light))
                            .offset(x:-10)
                        
                        Text("8.5")
                            .font(.title)
                            .fontWeight(.semibold)
                            .fixedSize()
                            .frame(width:20)
                            .foregroundColor(Color.red)
                        //                                .offset(x:10,y:1)
                    }
                    .offset(x:-20)
                }
                
                Text("Fits tight because of the double laces. Going up a full size is recommended")
                    .lineLimit(nil)
                    .padding(.top,10)
                
            }
            
        }
        .frame(width:380, height:200)
        .padding(.horizontal,10)
//        .padding(.vertical,5)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        .padding(.horizontal)
//        .padding(.top,25)
            
        .padding(.trailing,30)
    }
}

//struct RatingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingForm(sizeRating: <#Binding<Int>#>, testReview: <#Binding<String>#>)
//    }
//}
