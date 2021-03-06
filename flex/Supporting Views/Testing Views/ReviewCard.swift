//
//  ReviewCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewCard: View {
    @State private var flame : Bool = false
    var body: some View {
        
        HStack {
            CircleImage(image: Image("sacai") )
                .frame(width: 136, height: 136)
                .offset(x:-40)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Nike")
                            .font(.title)
                            .fixedSize()
                            .frame(width:100)
                        
                        Text("LDV Waffle")
                            .font(.headline)
                            .fixedSize()
                            .frame(width:100)
                    }
                    .offset(x:-20)
                    Image(systemName: "flame")
                        .font(.system(size: 30, weight: .medium))
                        .offset(x:60, y:-30)
                        .foregroundColor(flame ? Color.red : Color.gray)
                        .onTapGesture {
                            print("work")
                            self.flame.toggle()
                    }
                    
                }
                
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "s.circle")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 15, weight: .medium))
                            Text("265")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                        }.offset(x:-10)
                        
                        //                    .offset(x:40, y:-25)
                        HStack {
                            Image(systemName: "flame")
                                .foregroundColor(Color.red)
                                .font(.system(size: 15, weight: .medium))
                            Text("533")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                        }
                        .offset(x:20)
                        //                    .offset(x:40, y:-40)
                        
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                                .foregroundColor(Color.black)
                                .font(.system(size: 10, weight: .medium))
                            Text("2")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                        }
                        .offset(x:50, y:1)
                        
                    }
                    .offset(x:-10)
                    //                    .offset(y:10)
                    //                .offset(x:40, y:-10)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 30, weight: .light))
                        
                        Text("8.5")
                            .font(.title)
                            .fontWeight(.semibold)
                            .fixedSize()
                            .frame(width:20)
                            .foregroundColor(Color.blue)
                            .offset(x:10,y:1)
                    }
                    .offset(x:60)
                }
                
                
            }
            
            
        }
        .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard()
    }
}

