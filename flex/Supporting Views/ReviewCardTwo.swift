//
//  ReviewCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewCardTwo: View {
    var body: some View {
        HStack {
            CircleImage(image: Image("sacai") )
                .frame(width: 136, height: 136)
                .offset(x:-30)
            
            VStack {
                HStack {
                    VStack {
                        Text("Nike")
                            .font(.title)
                            .offset(x:-15, y:-5)
                        //                            .multilineTextAlignment(.center)
                        Text("LDV Waffle")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
//                    .offset(x:50,y:10)
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
                    }
                    .offset(x:40, y:-25)
                }
                
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "flame")
                                .foregroundColor(Color.red)
                                .font(.system(size: 15, weight: .medium))
                            Text("53")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                        }
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
                        //                        .offset(x:-9)
                        
                    }
                    .offset(y:10)
                    //                .offset(x:40, y:-10)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 30, weight: .medium))
                            .padding(.trailing,10)
                        Text("8.5")
                            .font(.title)
                            .fontWeight(.semibold)
                            .fixedSize()
                            .frame(width:20)
                            .foregroundColor(Color.green)
                    }
                    .offset(x:40, y:20)
                }
                
                
            }
            
            
        }
        .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
    }
}

struct ReviewCardTwo_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCardTwo()
    }
}

