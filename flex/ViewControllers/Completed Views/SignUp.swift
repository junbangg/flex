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
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var checkPassword : String = ""
    
    var body: some View {
        
        VStack {
            //            Spacer()
            if self.entry == 0 {
                TextField("What is your name?", text: $name)
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
            else if self.entry == 1 {
                TextField("your@email.com", text: $email)
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
            else if self.entry == 2 {
                TextField("Enter your password", text: $password)
                    .padding()
                    .background(MyColors.lightGreyColor)
                    .cornerRadius(5.0)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 50.0)
                    .padding(.top,150.0)
                if Utilities.isBlank(self.password) == false{
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                
                Spacer()
            }
            else if self.entry == 3 {
                TextField("Confirm your password", text: $checkPassword)
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
                    Button(action: {self.entry += 1}) {
                        ArrowButton()
                    }
                }
                
                Spacer()
            }
            else {
                GeometryReader {_ in
                    RootViewController()
                }
            }
            
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
