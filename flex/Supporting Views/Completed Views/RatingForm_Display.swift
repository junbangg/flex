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
                            .offset(x:-5,y:-1)
                        
                        Text("8.5")
                            .font(.title)
                            .fontWeight(.semibold)
                            .fixedSize()
                            .frame(width:20)
                            .foregroundColor(Color.gray)
                        //                                .offset(x:10,y:1)
                    }
                }
                Spacer()
                
                Text("adsfkjalskdjflka sdjfkljalksdfjl asj dflkaasdf\nalksdjflakdsjflkajsdl;fkasdj\nasdlfkj alsdkfj l\nalksdjflkajsdflkjasdklfjadlksjf\nlaksdjflkajdsf\nalksdfjladksjflaksj")
                    .lineLimit(nil)
                
            }
            
        }
        .frame(width:380, height:200)
        
        .padding(.trailing,30)
    }
}

//struct RatingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingForm(sizeRating: <#Binding<Int>#>, testReview: <#Binding<String>#>)
//    }
//}
