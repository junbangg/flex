//
//  NeuromorphicCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct NeuromorphicOutfit: View {
    var image: Image
    var brand: String
    var product: String
    
    @State var expand = false
    
    var body: some View {
        
        VStack(spacing:12) {
            ScrollView(.horizontal) {
                HStack {
                    VStack {
                        RectangleImage(image: image)
                            .frame(width: 130, height: 180)
                        //            Text(brand)
                        //                .font(.title)
                        //                .padding(.top,5)
                        Text(brand)
                            .padding(.top,5)
                    }
                    
                    VStack(spacing:20) {
                        HStack(spacing: 20) {
                            Text("Top")
                                .font(.caption)
                            
                            Text("유니클로")
                                .font(.caption)
                                .padding(.horizontal)
                        }
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        
                        HStack(spacing: 25) {
                            Text("Bottom")
                                .font(.caption)
                            Text("APC")
                                .font(.caption)
                        }
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        
                        HStack(spacing:25) {
                            Text("Shoes")
                                .font(.caption)
                            
                            Text("Converse 척테일러")
                                .font(.caption)
                        }
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                    }
                }
                .padding(.leading,25)
            }
            //Number data
            HStack {
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
                        .offset(y:1)
                }
                .padding(.horizontal)
                Spacer()
                HStack {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .foregroundColor(Color.black)
                        .font(.system(size: 10, weight: .medium))
                        .offset(y:2)
                    Text("2")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fixedSize()
                        .frame(width:20)
                        .foregroundColor(Color.gray)
                }
                .padding(.horizontal)
                
            }
            
            //            Text(product)
            //                .font(.caption)
            //                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .frame(width:(UIScreen.main.bounds.width-60)/2)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
