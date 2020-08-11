//
//  RegistrationEmail.swift
//  MemoChat
//
//  Created by Jun suk Bang on 2020/04/24.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    
    @State private var entry : Int = 0
    @State private var name : String = ""
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var checkPassword : String = ""
    @State private var validationIncomplete : Bool = false
    @State private var registerSuccess : Bool = false
    @State private var imageSelected = false
    @State private var isShowingImagePicker = false
    @State private var outfitImage = UIImage()
    
    
    // MARK: - Method to check information validation
    func validateFields() -> Bool {
        
        //        if lastname.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        //            return false
        //        }
        //        if firstname.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        //        }
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if checkPassword.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if username.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        
        let cleanedPassword = checkPassword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidPassword(cleanedPassword) == false {
            return false
        }
        
        return true
    }
    var body: some View {
        
        VStack {
            // MARK: - Name
            if self.entry == 0 {
                TextField("이름", text: $name)
                    .padding()
                    .background(MyColors.lightGreyColor)//or white
                    //                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                
                if Utilities.isBlank(self.name) == false{
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                
                Spacer()
            }
                // MARK: - Username
            else if self.entry == 1 {
                TextField("닉네임", text: $username)
                    .padding()
                    .background(MyColors.lightGreyColor)//or white
                    //                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                
                if Utilities.isBlank(self.username) == false{
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                Spacer()
            }
                // MARK: - Profile pic
            else if self.entry == 2{
                
                if imageSelected == false {
                    VStack {
                        Text("프로필 이미지 설정")
                            .padding(.bottom, 50)
                        ZStack {
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
                                ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$outfitImage, isSelected: self.$imageSelected)
                            })
                            
                        }
                            Button (action: {
                                self.entry += 1
                            }) {
                                Text("나중에 할게요")
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.top,30)
                        
                    }
                    
                }else {
                    VStack {
                        Text("프로필 이미지 설정")
                        .padding(.bottom, 50)
                        //                        Text("프로필 사진")
                        ZStack {
                            CircleImage(image: Image(uiImage: outfitImage))
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
                                ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$outfitImage, isSelected: self.$imageSelected)
                            })
                            
                        }
                        VStack {
                            ArrowButton()
                            Button (action: {
                                self.entry += 1
                            }) {
                                Text("나중에 할게요")
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.top,10)
                        }
                        .padding(.top, 30)
                    }
                    
                }
            }
                // MARK: - Email
            else if self.entry == 3 {
                TextField("이메일", text: $email)
                    .padding()
                    .background(MyColors.lightGreyColor)
                    //                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                if Utilities.isValidEmail(self.email){
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                
                Spacer()
            }
                // MARK: - Password
            else if self.entry == 4 {
                TextField("비밀번호", text: $password)
                    .padding()
                    .background(MyColors.lightGreyColor)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                if Utilities.isValidPassword(self.password) == true{
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                
                Spacer()
            }
                //MARK: - Password check
            else if self.entry == 5 {
                TextField("비밀번호 확인", text: $checkPassword)
                    .padding()
                    .background(MyColors.lightGreyColor)
                    //                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                if Utilities.matchPasswords(self.password, self.checkPassword){
                    Button(action: {
                        // MARK: - Login Handling
                        if self.validateFields() {
                            
                            guard let myUrl = URL(string: "http://localhost:3000/api/users") else { return }
                            
                            let params = ["email": self.email, "password": self.checkPassword, "username": self.username]
                            
                            var request = URLRequest(url: myUrl)
                            request.httpMethod = "POST"
                            do {
                                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                            } catch let error{
                                print(error.localizedDescription)
                            }
                            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                            
                            //                                            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: data, options:.init())
                            
                            URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error : Error?) in
                                
                                if let err = error {
                                    print("Failed to login:", err)
                                    return
                                }
                                do {
                                    //parsed JSON into dictionary
                                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                                    
                                    if let parseJSON = json {
                                        //additional error handeling required
                                        let status = parseJSON["status"] as? Int
                                        print(parseJSON)
                                        if status == 200 {
                                            print(parseJSON)
                                            print("Successfully Registered")
                                            self.registerSuccess = true
                                            self.entry += 1         
                                        }
                                        
                                        
                                    } else {
                                        print("something went wrong")
                                    }
                                } catch {
                                    print(error)
                                }
                                //                                print("Successfully Registered")
                                //                                self.entry += 1
                                //                                self.registerSuccess = true
                                
                                
                            }
                                .resume() // never forget this resume
                        }
                        else {
                            //enable validation alert
                            self.validationIncomplete = true
                            print("error")
                        }
                        
                    }) {
                        ArrowButton()
                    }
                    .alert(isPresented: $validationIncomplete) {
                        Alert(title: Text("Incomplete form"), message: Text("Please check if all fields are correctly filled"))
                    }
                    .alert(isPresented: $registerSuccess) {
                        
                        Alert(title: Text("Register Successful"), message: Text("Thank you for your time!"))
                        
                    }
                }
                
                Spacer()
            }
                //MARK: - Go to SignIn
            else if self.entry == 6 {
                GeometryReader {_ in
                    SignIn()
                }
            }
            
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
}
//
//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}
