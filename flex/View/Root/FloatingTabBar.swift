//
//  FloatingTabBar.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct FloatingTabBar : View {
    
    @Binding var selected : Int
    @State var expand = false
    
    var body : some View{
        
        HStack{
            
            Spacer(minLength: 0)
            // MARK: - Floating Navigation Tab
            HStack{
                
                if !self.expand{
                    
                    Button(action: {
                        
                        self.expand.toggle()
                        
                    }) {
                        if self.selected == 0 {
                            Image(systemName: "house").font(.system(size: 20, weight: .medium)).foregroundColor(MyColors.ferrariRed).padding()
                        }
                        else if self.selected == 1{
                            Image(systemName: "magnifyingglass").font(.system(size: 20, weight: .medium)).foregroundColor(MyColors.ferrariRed).padding()
                        }
                        else if self.selected == 2{
                            Image(systemName: "plus.app").font(.system(size: 20, weight: .medium)).foregroundColor(MyColors.ferrariRed).padding()
                        }
                        else{
                            Image(systemName: "person.circle").font(.system(size: 20, weight: .medium)).foregroundColor(MyColors.ferrariRed).padding()
                        }
                        
                    }
                }
                else{
                    
                    Button(action: {
                        
                        self.selected = 0
                        
                    }) {
                        Image(systemName: "house")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 0 ? MyColors.ferrariRed : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 1
                        
                    }) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 1 ? MyColors.ferrariRed : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 2
                        
                    }) {
                        
                        Image(systemName: "plus.app")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 2 ? MyColors.ferrariRed : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 3
                        
                    }) {
                        
                        Image(systemName: "person.circle")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 3 ? MyColors.ferrariRed : .gray).padding(.horizontal)
                    }
                }
                
                
            }.padding(.vertical,self.expand ? 20 : 8)
                .padding(.horizontal,self.expand ? 35 : 8)
                //                .background(Color.white)
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .clipShape(Capsule())
                .padding(22)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .gesture(DragGesture()
                    .onEnded{_ in
                        self.expand.toggle()
                })
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
            //                .onLongPressGesture {
            //
            //                    self.expand.toggle()
            //            }
            //            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
        
        
    }
}

//struct FloatingTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        FloatingTabBar()
//    }
//}
