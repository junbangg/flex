//
//  ReviewOrOutfit.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/19.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewOrOutfit: View {
    @State var selected : Int? = nil
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: AddOutfit()) {
                    VStack {
                        Text("Outfit")
                            .font(.headline)
                            .foregroundColor(Color.black)
                        Image(systemName:"checkmark.circle")
                            .font(.system(size:40))
                    }
                    .padding(.horizontal,25)
                    .padding(.vertical,20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal)
                }
                
                //                Spacer()
                NavigationLink(destination: ReviewCard_Edit()) {
                    VStack {
                        Text("Review")
                            .foregroundColor(Color.black)
                            .font(.headline)
                        Image(systemName: "checkmark.circle")
                            .font(.system(size:40))
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal)
                }
                
            }
            .offset(y:-100)
        }
        //            .navigationViewStyle(StackNavigationViewStyle())
        //            .navigationBarTitle("Add")
        //            .navigationBarHidden(true)
    }
    
    
    
    
    
    
}


//struct ReviewOrOutfit_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewOrOutfit()
//    }
//}
struct NeuromorphicRectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray, lineWidth:4)
                                    .cornerRadius(8)
                                    .blur(radius: 4)
                                    .offset(x:2, y:3)
                                    .mask(Rectangle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .cornerRadius(8)
                                    .blur(radius :4)
                                    .offset(x:-2,y:-2)
                                    .mask(Rectangle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                        
                    } else {
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    }
                }
                    
                    //                .frame(width:50,height:35)
                    .frame(width:300,height:200)
                
        )
    }
}
