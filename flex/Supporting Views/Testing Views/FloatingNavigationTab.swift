//
//  FloatingNavigationTab.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/23.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct FloatingNavigationTab: View {
    
    //    @State var selected : Int
    @State var expand = false
    
    let col1 = UIColor(red: 235, green: 235, blue: 235, alpha: 1)
    
    var body : some View{
        
        HStack{
            Spacer(minLength: 0)
            HStack{
                if !self.expand{
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "chevron.left").foregroundColor(.gray).padding().font(.system(size: 20, weight: .medium))
                    }
                }
                else{
                    
                    //                    Button(action: {
                    //
                    //                        print("goto home")
                    //
                    //                    }) {
                    //                        Image(systemName: "house")
                    //                            .font(.system(size: 20, weight: .medium))
                    //                            //                            .foregroundColor(self.selected == 0 ? .black : .gray).padding(.horizontal)
                    //                            .foregroundColor(Color.black)
                    //                    }
                    
                    //                    Image(systemName: "chevron.right").foregroundColor(.black).padding().font(.system(size: 20, weight: .medium))
                    
                    NavigationLink(destination: FeedViewController()) {
                        Image(systemName: "house")
                            .font(.system(size: 20, weight: .medium))
                            .padding(.leading)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer(minLength: 15)
                    
                    NavigationLink(destination: ReviewCard_Display()) {
                        Image(systemName: "plus.app")
                            .font(.system(size: 20, weight: .medium))
                    }
                    
                    Spacer(minLength: 15)
                    
                    NavigationLink(destination: MyPageViewController()) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 20, weight: .medium))
                    }
                }
                
                
            }.padding(.vertical,self.expand ? 20 : 8)
                .padding(.horizontal,self.expand ? 35 : 8)
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .clipShape(Capsule())
                .padding(22)
                .onTapGesture(count: 2) {
                    self.expand.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
        
    }
}


//struct FloatingNavigationTab_Previews: PreviewProvider {
//    static var previews: some View {
//        FloatingNavigationTab()
//    }
//}
