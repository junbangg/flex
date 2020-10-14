//
//  FollowButton.swift
//  flex
//
//  Created by Jun suk Bang on 2020/10/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

// MARK: - Follow Button
struct FollowButton : View {
    
    @Binding var selected : Int
    @State var expand = true
    
    var body : some View{
        
        HStack{
            HStack{
                if !self.expand{
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        if self.selected == 0 {
                            Image(systemName: "flame").font(.system(size: 20, weight: .medium)).foregroundColor(.white).padding()
                        }
                    }
                }
                else{
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("팔로우")
                            .foregroundColor(MyColors.ferrariRed)
                    }
                    
                    
                    //                    Spacer(minLength: 15)
                    
                }
                
                
            }.padding(.vertical,self.expand ? 20 : 8)
                .padding(.horizontal,self.expand ? 30 : 8)
                //                .background(Color.white)
                .background(self.expand ? .white : MyColors.ferrariRed)
                .clipShape(Capsule())
                //                .padding(22)
                .padding(15)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
            
        }
        
        
    }
}
