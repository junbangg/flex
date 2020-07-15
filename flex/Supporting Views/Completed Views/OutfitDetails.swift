//
//  OutfitDetails.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/11.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct OutfitDetails: View {
    
    @State var bookmarkPressed : Bool = false
    @State var flamePressed : Bool = false
    
    @State var comment : String = ""
    @State var viewState = CGSize.zero
    var body: some View {
        VStack {
            ScrollView {
                
                VStack {
                    // MARK: - 기본정보
                    HStack(spacing: 15) {
                        HStack {
                            //user
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(MyColors.ferrariRed)
                                    .frame(width:40, height: 2)
                                    .zIndex(1)
                                
                                CircleImage(image: Image("testProfile"))
                                    .frame(width:50, height:50)
                                    .padding(.top, 6)
                                    .padding(.bottom,4)
                                    .padding(.horizontal, 8)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                                    .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                                Text("olafo0o")
                                    .font(.caption)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .offset(y:5)
                            }
                            //제목
                            VStack(alignment: .leading){
                                Text("도서관 가는 길")
                                    .font(.title)
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.center)
//                                Text("공부하러 가는 길")
//                                    .font(.headline)
//                                    .foregroundColor(Color.gray)
//                                    .multilineTextAlignment(.center)
                            }
                            .padding(.leading,20)
                            //bookmark
                            Spacer()
                            Button(action: {
                                self.bookmarkPressed.toggle()
                            }) {
                                Image(systemName: "bookmark")
                                    .foregroundColor(self.bookmarkPressed == false ? .gray : .blue)
                                .font(.system(size: 35, weight: .medium))
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding()
                    // MARK: - 데이터
                    VStack {
                        HStack {
                            //size info
                            HStack {
                                Image(systemName: "eye")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 15, weight: .medium))
                                Text("320")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                                    .foregroundColor(Color.gray)
                                    .offset(x:10)
                            }
                            .offset(x:-30)
                            Spacer()
                            
                            //                    .offset(x:40, y:-25)
                            //flame info
                            HStack {
                                Image(systemName: "bubble.left.and.bubble.right")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 15, weight: .medium))
                                Text("2")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                                    .foregroundColor(Color.gray)
                            }
                            .offset(x:5)
                            Spacer()
                            //                                .offset(x:20)
                            //                    .offset(x:40, y:-40)
                            
                            HStack {
                                Image(systemName: "bookmark")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 20, weight: .medium))
                                Text("2234")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:50)
                                    .foregroundColor(Color.gray)
//                                    .offset(x:-10)
                            }
                            .offset(x:20)
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "flame")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 20, weight: .medium))
                                Text("533")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                                    .foregroundColor(Color.gray)
                                    .offset(x:10)
                            }
                            .offset(x:40)
                            Spacer()
                            //                                .offset(x:50, y:1)
                            
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal,50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal)
                    
                    // MARK: - 사진
                    ZStack {
                        HStack {
                            VStack(alignment: .leading,spacing: 70) {
                                HStack {
                                    Text("Top")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("유니클로")
                                        .font(.title)
                                        .foregroundColor(Color.black)
                                        .offset(x:-220)
                                }
                                
                                HStack {
                                   Text("Bottom")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("APC")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .offset(x:-220)
                                }
                                HStack {
                                    Text("Shoe")
                                        .font(.headline)
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("컨버스")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .offset(x:-220)
                                }
                                HStack {
                                    Text("Accessory")
                                        .font(.headline)
                                    .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("캉골")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .offset(x:-220)
                                }
                                
                            }
                        }
                        VStack {
                            RectangleImage(image: Image("outfitTwo"))
                                .frame(width: 300, height: 450)
                                .offset(x:30)
                        }
                        .offset(x: viewState.width)
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
                    .padding(.top,20)
                    
                }
                    //Set Offset for entire VStack
                    .offset(y:30)
                
            }
            // MARK: - 댓글창
            // TODO: - Add navigation to a new Comments page(Create as well)
            HStack {
                
                Image(systemName: "bubble.left.and.bubble.right")
                    .foregroundColor(Color.black)
                    .font(.system(size: 15, weight: .medium))
                    .padding(.leading,10)
                Text("22")
                    .font(.headline)
                    .fontWeight(.regular)
                    .fixedSize()
                    .frame(width:20)
                    .foregroundColor(Color.gray)
                
                Spacer()
                TextField("댓글을 입력하세요...", text: $comment)
                
                
                Button(action: {
                    print("send")
                }) {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color.blue)
                        .font(.system(size:20, weight: .medium))
                    
                }
                    //                    .padding(.trailing,10)
                    .buttonStyle(NeuromorphicButtonStyle())
                
                
                
            }
        }
    }
}

struct OutfitDetails_Previews: PreviewProvider {
    static var previews: some View {
        OutfitDetails()
    }
}
