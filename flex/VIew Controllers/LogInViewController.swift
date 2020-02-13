//
//  LogInViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/17.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//FIX: Navigation and picker for gender do not function when tried again

import SwiftUI

struct LogInViewController: View {
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var action :  Int? = 0
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 10.0) {
                
                Logo()
                
                Group {
                    TextField("User ID", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 50.0)
                
                HStack {
                    Button(action: {print("\(self.username) : \(self.password)")}) {
                        Text("Login")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                            .overlay(
                                Capsule(style: .continuous)
                                    .size(width:80, height:35)
                                    .stroke(Color.red, lineWidth : 2.5)
                                    .offset(x:-18, y:-7)
                        )
                    }
                    .padding(.leading, 10.0)
                    
                    //                NavigationLink(destination: RegisterViewController(),tag:1,selection:$action ) {
                    //                    EmptyView()
                    //                }
                    //                    Text("Sign Up")
                    //                        .font(.body)
                    //                        .fontWeight(.semibold)
                    //                        .foregroundColor(Color.gray)
                    //                        .overlay(
                    //                            Capsule(style: .continuous)
                    //                                .size(width:80, height:35)
                    //                                .stroke(Color.gray, lineWidth : 2.5)
                    //                                .offset(x:-10, y:-7)
                    //                    )
                    //                        .onTapGesture {
                    //                            self.action = 1
                    //                    }
                    
                    NavigationLink(destination: RegisterViewController() ) {
                        Text("Sign Up")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .overlay(
                                Capsule(style: .continuous)
                                    .size(width:80, height:35)
                                    .stroke(Color.gray, lineWidth : 2.5)
                                    .offset(x:-10, y:-7)
                        )
                    }
                        //                Button(action: {print("\(self.username) : \(self.password)")}) {
                        //                    Text("Sign Up")
                        //                        .font(.body)
                        //                        .fontWeight(.semibold)
                        //                        .foregroundColor(Color.gray)
                        //                        .overlay(
                        //                            Capsule(style: .continuous)
                        //                                .size(width:80, height:35)
                        //                                .stroke(Color.gray, lineWidth : 2.5)
                        //                                .offset(x:-10, y:-7)
                        //                    )
                        //                }
                        .padding(.leading, 50)
                    
                }
                .padding(.top, 10.0)
                
            }
            .padding(.bottom, 200)
            
        }
        
    }
}

struct LogInViewController_Previews: PreviewProvider {
    static var previews: some View {
        LogInViewController()
    }
}
