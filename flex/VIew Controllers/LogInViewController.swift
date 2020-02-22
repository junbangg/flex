//
//  LogInViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/17.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//FIX: Navigation and picker for gender do not function when tried again

import SwiftUI
import FirebaseAuth

struct LogInViewController: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var action :  Int? = 0
    @State private var selection : Int? = nil
    @State private var validationIncomplete : Bool = false
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    func validateFields() -> Bool {
        if Utilities.isValidEmail(email.trimmingCharacters(in: .whitespacesAndNewlines)) == true && Utilities.isValidPassword(password.trimmingCharacters(in: .whitespacesAndNewlines)) == true {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView{
            VStack {
                
                VStack(alignment: .center, spacing: 10.0) {
                    
                    Logo()
                    
                    Group {
                        TextField("Email", text: $email)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        
                        
                        TextField("Password", text: $password)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 50.0)
                    //                HStack {
                    //                    Button(action: {print("\(self.username) : \(self.password)")}) {
                    //                        Text("Login")
                    //                            .font(.body)
                    //                            .fontWeight(.semibold)
                    //                            .foregroundColor(Color.red)
                    //                            .overlay(
                    //                                Capsule(style: .continuous)
                    //                                    .size(width:80, height:35)
                    //                                    .stroke(Color.red, lineWidth : 2.5)
                    //                                    .offset(x:-18, y:-7)
                    //                        )
                    //                    }
                    //                    .padding(.leading, 10.0)
                    //
                    //
                    
                    //                        //                Button(action: {print("\(self.username) : \(self.password)")}) {
                    //                        //                    Text("Sign Up")
                    //                        //                        .font(.body)
                    //                        //                        .fontWeight(.semibold)
                    //                        //                        .foregroundColor(Color.gray)
                    //                        //                        .overlay(
                    //                        //                            Capsule(style: .continuous)
                    //                        //                                .size(width:80, height:35)
                    //                        //                                .stroke(Color.gray, lineWidth : 2.5)
                    //                        //                                .offset(x:-10, y:-7)
                    //                        //                    )
                    //                        //                }
                    //                        .padding(.leading, 50)
                    //
                    //                }
                    //                        .padding(.top, 10.0)
                    
                }
                .padding(.bottom, 10.0)
                
                HStack {
                    //                    if self.validateFields(){
                    NavigationLink(destination: LogInViewController(), tag: 1, selection: $selection){
                        EmptyView()
                        Button(action: {
                            print("testing")
                            //navigate to home screen
                            //                        if self.validateFields() {
                            //
                            //                            //disable validation alert
                            //                            self.validationIncomplete = false
                            //                            //change tag for navigation to home screen
                            //                            self.selection = 1
                            //                        }else {
                            //                            //enable validation alert
                            //                            self.validationIncomplete = true
                            //                            print("error")
                            //                        }
                            
                        }) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Login").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                        }.padding()
                            .background(Color.red)
                            .cornerRadius(4.0)
                        //                        .alert(isPresented: $validationIncomplete) {
                        //                            Alert(title: Text("Incomplete form"), message: Text("Please check if all fields are correctly filled"))
                        //                    }
                        
                    }
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 10.0)
                    //                    }
                }
                
                
                HStack {
                    //                    if self.validateFields(){
                    NavigationLink(destination: RegisterViewController(), tag: 2, selection: $selection){
                        EmptyView()
                        Button(action: {
                            print("testing")
                            self.selection = 2
                            //navigate to home screen
                            //                        if self.validateFields() {
                            //
                            //                            //disable validation alert
                            //                            self.validationIncomplete = false
                            //                            //change tag for navigation to home screen
                            //                            self.selection = 1
                            //                        }else {
                            //                            //enable validation alert
                            //                            self.validationIncomplete = true
                            //                            print("error")
                            //                        }
                            
                        }) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Sign Up").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                        }.padding()
                            .background(Color.gray)
                            .cornerRadius(4.0)
                        //                        .alert(isPresented: $validationIncomplete) {
                        //                            Alert(title: Text("Incomplete form"), message: Text("Please check if all fields are correctly filled"))
                        //                    }
                        
                    }
                    .padding(.horizontal, 50.0)
                    //                    }
                }
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct LogInViewController_Previews: PreviewProvider {
    static var previews: some View {
        LogInViewController()
    }
}
