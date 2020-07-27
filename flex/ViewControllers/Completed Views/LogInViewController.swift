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

struct LogInViewController: View {
    //    public var accessToken : String?
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var action :  Int? = 0
    @State private var selection : Int? = nil
    @State private var validationIncomplete : Bool = false
    
    
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
                    //                    if self.validateFields(){
                    NavigationLink(destination: RootViewController(), tag: 1, selection: $selection){
                        EmptyView()
                        
                        Button(action: {
                            let cleanedEmail = self.email.trimmingCharacters(in: .whitespacesAndNewlines)
                            let cleanedPassword = self.password.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            //maybe make an if statement to check if email and password is empty?
                            
                            
                            // MARK: - Login Handling
                            
                            guard let myUrl = URL(string: "http://15.164.142.209:3001/api/users/login") else { return }
                            
                            var components = URLComponents(url: myUrl, resolvingAgainstBaseURL: false)!
                            
                            components.queryItems = [
                                URLQueryItem(name: "email", value: cleanedEmail),
                                URLQueryItem(name: "pw", value: cleanedPassword)
                            ]
                            let query = components.url!.query
                            
                            var loginRequest = URLRequest(url: myUrl)
                            loginRequest.httpMethod = "POST"
                            
                            loginRequest.httpBody = Data(query!.utf8)
                            
                            let task = URLSession.shared.dataTask(with: loginRequest) { (data: Data?, response : URLResponse?, error: Error?) in
                                
                                if let err = error {
                                    print("Failed to login:", err)
                                    return
                                }
                                // MARK: - Receive JSON Data
                                do {
                                    //parsed JSON into dictionary
                                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                                    
                                    if let parseJSON = json {
                                        
                                        print(parseJSON)
                                        //extracted result dictionary from whole JSON
                                        let result = parseJSON["result"] as? [String: AnyObject]
                                        //extracted profile dictionary from result dictionary
                                        let profile = result!["profile"] as? [String: AnyObject]
                                        //saved accessToken and userID
                                        let accessToken = result!["token"] as? String
                                        let userID = profile!["id"] as? Int
                                        //                                        print("Access Token: \(String(describing: accessToken!))")
                                        
                                        let saveAccessToken: Bool = KeychainWrapper.standard.set(accessToken!, forKey: "accessToken")
                                        let saveuserID: Bool = KeychainWrapper.standard.set(userID!, forKey: "userID")
                                        
                                        print("The access token save result: \(saveAccessToken)")
                                        print("The userID save sesult: \(saveuserID)")
                                        
                                        if accessToken == nil
                                        {
                                            print("error with access token")
                                            return
                                        }
                                        self.selection = 1
                                        print("Probably logged in successfully..")
                                        //
                                        
                                    } else {
                                        print("something went wrong")
                                    }
                                } catch {
                                    print(error)
                                }
                                
                            }
                            task.resume() // never forget this resume
                            
                            
                        }) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Sign In").foregroundColor(Color.white).bold()
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

struct LogInViewController_Previews: PreviewProvider {
    static var previews: some View {
        LogInViewController()
    }
}
