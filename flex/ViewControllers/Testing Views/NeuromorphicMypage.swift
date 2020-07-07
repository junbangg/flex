//
//  NeuromorphicMypage.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/05.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct NeuromorphicMypage: View {
    var body: some View {
        Home()
    }
}

struct NeuromorphicMypage_Previews: PreviewProvider {
    static var previews: some View {
        NeuromorphicMypage()
    }
}

struct Home: View{
    
    @State private var index = 0
    var body: some View {
        ZStack {
//            MyColors.offwhite
            VStack {
                //Top
                HStack(spacing: 15) {
//                    Button(action: {
//                        
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.system(size: 22))
//                            .foregroundColor(.black)
//                    }
                    Text("Profile")
                        .font(.title)
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }){
                        Image(systemName: "text.justify")
//                            .foregroundColor(MyColors.offwhite)
                            .foregroundColor(Color.black)
                            .padding(.vertical, 10)
//                            .padding(.horizontal, 25)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
//                    .buttonStyle(NeuromorhpicButtonStyle())
                }
                .padding()
                //Profile
                HStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(MyColors.lightGreyColor)
                            .frame(width:80, height: 3)
                            .zIndex(1)
                        
                        CircleImage(image: Image("testProfile"))
                            //                    .resizable()
                            .frame(width:100, height:100)
                            .padding(.top, 6)
                            .padding(.bottom,4)
                            .padding(.horizontal, 8)
//                            .background(MyColors.offwhite)
                            .background(Color.white)
                            .cornerRadius(10)
//                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//                            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                            .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                    }
                    VStack(alignment: .leading, spacing: 12) {
                        Text("olafo0o")
                            .font(.title)
                            .foregroundColor(Color.black.opacity(0.8))
                        Text("사용자 소개")
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    .padding(.leading,20)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal,20)
                .padding(.top,10)
                //App bar
                HStack(spacing: 25) {
                    Spacer()
                    Button(action: {
                        self.index = 0
                    }) {
                        Text("Outfits")
                            .foregroundColor(self.index==0 ? .white : .gray)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index==0 ? .gray : Color.clear)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        self.index = 1
                    }) {
                        Text("Reviews")
                            .foregroundColor(self.index==1 ? .white : .gray)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index==1 ? .gray : Color.clear)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        self.index = 2
                    }) {
//                        Text("Bookmarks")
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(self.index==2 ? .white : .gray)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index==2 ? .gray : Color.clear)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.horizontal,10)
                .padding(.vertical,5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .padding(.horizontal)
                .padding(.top,25)
                //Cards
                if self.index == 0 {
                    GeometryReader{_ in
                        UserOutfits()
                            .padding(.top,10)
                    }
                }
                else if self.index == 1 {
                    GeometryReader{_ in
                        UserReviews()
                            .padding(.top,10)
                    }
                }
                //                .padding(.top,10)
                
                Spacer(minLength: 0)
            }
            //        .background(Color.blue).edgesIgnoringSafeArea(.all)
        }
//        .edgesIgnoringSafeArea(.all)
        
    }
}
