//
//  ReviewCardThree.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ReviewCardThree: View {
    var body: some View {
        HStack {
            CircleImage(image: Image("sacai") )
                .frame(width: 136, height: 136)
                .offset(x:-30)
            
            VStack {
                HStack {
                    
                    VStack {
                        HStack {
                            Image(systemName: "flame")
                                .foregroundColor(Color.red)
                                .font(.system(size: 20, weight: .medium))
                            Text("53")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                                .padding(.leading,10)
                        }
                        //                    .offset(x:40, y:-40)
                        
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                                .foregroundColor(Color.black)
                                .font(.system(size: 15, weight: .medium))
                            Text("2")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fixedSize()
                                .frame(width:20)
                                .foregroundColor(Color.gray)
                                .padding(.leading,10)
                        }
                        //                        .offset(x:-9)
                        
                    }
                    //                    .offset(x:40, y:-10)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 30, weight: .medium))
                        Text("8.5")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                    .offset(x:45, y:-30)
                }
                HStack {
                    VStack {
                        Text("Nike")
                            .font(.title)
                            .offset(x:-15)
                        //                            .multilineTextAlignment(.center)
                        Text("LDV Waffle")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    HStack {
                        Image(systemName: "s.circle")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 20, weight: .medium))
                        Text("265")
                            .font(.headline)
                            .fontWeight(.regular)
                            .fixedSize()
                            .frame(width:20)
                            .foregroundColor(Color.gray)
                            .padding(.leading,10)
                    }
                }
                
                //                .offset(y:-10)
                
            }
            
            
        }
        .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
    }
}

struct ReviewCardThree_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCardThree()
    }
}
