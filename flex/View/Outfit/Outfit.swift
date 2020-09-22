//
//  NeuromorphicCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct Outfit: View {
    var image: Image
    var brand: String
    var product: String
    @Binding var isNavBarHidden : Bool
    
    @State var viewState = CGSize.zero
    
    var body: some View {
        NavigationLink(destination: OutfitDetails(isNavBarHidden: self.$isNavBarHidden)) {
            VStack(spacing:12) {
                ZStack {
                    //글씨
                    VStack(spacing: 5) {
                        HStack(spacing: 10) {
                            Text("Top")
                                .font(.headline)
                            
                            Text("유니클로")
                                .font(.caption)
                            //                            .padding(.horizontal)
                        }
                        .cornerRadius(10)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        //                    .padding(.horizontal)
                        
                        HStack(spacing: 10) {
                            Text("Bottom")
                                .font(.headline)
                            Text("APC")
                                .font(.caption)
                        }
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        //                    .padding(.horizontal)
                        
                        HStack(spacing:10) {
                            Text("Shoes")
                                .font(.headline)
                            
                            Text("컨버스")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        //                    .padding(.horizontal)
                    }
                    .offset(y:-50)
                    .animation(.spring())
                    //이미지
                    VStack {
                        RectangleImage(image: image)
                            .frame(width: 130, height: 180)
                        //            Text(brand)
                        //                .font(.title)
                        //                .padding(.top,5)
                        Text(brand)
                            .padding(.top,5)
                    }
                    .offset(y: viewState.height)
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onChanged{value in
                                self.viewState = value.translation
                        }
                        .onEnded{ value in
                            self.viewState = .zero
                        }
                    )
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
    .buttonStyle(PlainButtonStyle())
        
    }
}
