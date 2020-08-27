//
//  ProfileEdit.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/13.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI
import AWSS3

struct ProfileEdit: View {
    @EnvironmentObject var obj : observed
    @Binding var isNavBarHidden : Bool
    @State private var text : String = ""
    @State private var imageSelected = false
    @State private var isShowingImagePicker = false
    @State private var profileImage = UIImage()
//    var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
    var body: some View {
        
        VStack {
            //MARK: - Profile Picture
            ZStack {
                if imageSelected == false {
                   CircleImage(image: Image(systemName: "person.fill"))
                    //                    .resizable()
                    .frame(width:200, height:200)
                    .padding(.top, 6)
                    .padding(.bottom,4)
                    .padding(.horizontal, 8)
                    //                            .background(MyColors.offwhite)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                    .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                }else {
                    CircleImage(image: Image(uiImage: self.profileImage))
                    //                    .resizable()
                    .frame(width:200, height:200)
                    .padding(.top, 6)
                    .padding(.bottom,4)
                    .padding(.horizontal, 8)
                    //                            .background(MyColors.offwhite)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                    .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                }
                
                    
                Button(action: {
                    self.isShowingImagePicker.toggle()
                }) {
                    Image(systemName: "plus.app")
                        .font(.system(size:50,weight:.light))
                        .foregroundColor(Color.blue)
                }
                .padding(.top)
                .padding(.bottom)
                .sheet(isPresented: self.$isShowingImagePicker, content: {
                    ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$profileImage, isSelected: self.$imageSelected)
                })
                
            }
            //MARK: - Profile Intro
            VStack {
                TextView()
                    .frame(height:self.obj.size)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.top, 6)
            .padding(.bottom,4)
            .padding(.horizontal, 8)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
            .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
            .padding()
            Spacer()
            
            
        }
        .padding(.top,10)
    .padding(10)
        .navigationBarTitle("프로필 수정")
        .navigationBarItems(trailing:
            Button(action: {
                //MARK: - Upload image to AWSS3
                AWSS3Manager.shared.uploadImage(image: self.profileImage, progress: {[self] ( uploadProgress) in
                    
                    print(Float(uploadProgress))
                    
                }) {[self] (uploadedFileUrl, error) in
                    
//                    guard let strongSelf = self else { return }
                    if let finalPath = uploadedFileUrl as? String { // 3
                        print(finalPath)
                    } else {
                        print("\(String(describing: error?.localizedDescription))") // 4
                    }
                }
            }) {
                Text("저장")
        })
            .onAppear{
                self.isNavBarHidden = false
        }
    }
}
//
//struct ProfileEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEdit()
//    }
//}
