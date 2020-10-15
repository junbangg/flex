//
//  LogInViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/17.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//FIX: Navigation and picker for gender do not function when tried again

import SwiftUI
import SwiftKeychainWrapper

struct SignIn: View {
    @ObservedObject var viewModel : LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var action :  Int? = 0
    @State private var selection : Int? = nil
    @State private var validationIncomplete : Bool = false
    @State private var loginFailed : Bool = false
    
    
    // MARK: - Method to check if all data is valid
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
                    // MARK: - Login Form
                    Group {
                        TextField("Email", text: $email)
                            .padding()
                            .background(MyColors.lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                        
                        TextField("Password", text: $password)
                            .padding()
                            .background(MyColors.lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                    .padding(.horizontal, 50.0)
                    
                }
                .padding(.bottom, 10.0)
                
                HStack {
                    // MARK: - Login Button
                    NavigationLink(destination: viewModel.goToRoot, tag: 1, selection: $selection){
                        EmptyView()
                        
                        Button(action: {
                            let cleanedEmail = self.email.trimmingCharacters(in: .whitespacesAndNewlines)
                            let cleanedPassword = self.password.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            // MARK: - Testing MVVM Version
                            self.viewModel.loginRequest(email: cleanedEmail, password: cleanedPassword)
                            
                            if self.viewModel.dataSource?.status == 200 {
                                let _: Bool = KeychainWrapper.standard.set(self.viewModel.dataSource!.token!, forKey: "accessToken")
                                let _: Bool = KeychainWrapper.standard.set(self.viewModel.dataSource!.id, forKey: "userID")
                                self.selection = 1
                                print("login successful")
                            } else{
                                print("something went wrong")
                                self.loginFailed = true
                            }
                            
                            
                        }) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Sign In").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                        }.padding()
                            .background(Color.red)
                            .cornerRadius(4.0)
                            .alert(isPresented: $loginFailed) {
                                Alert(title: Text("로그인 실패"), message: Text("이메일과 비밀번호를 확인해주세요"))
                        }
                        
                    }
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 10.0)
                    //                    }
                }
                
                // MARK: - Sign Up Button
                HStack {
                    NavigationLink(destination: SignUp(), tag: 2, selection: $selection){
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
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
        }
        
        
    }
}

