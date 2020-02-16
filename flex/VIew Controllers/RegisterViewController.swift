//
//  RegisterViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/11.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//Way to dismiss keyboard after tap out
//add to SceneDelegate ContentView
//.onTapGesture { window.endEditing(true)}

// TODO: Make validation method for sign up button
// TODO: Link validation method with a boolean for appropriate display of sign up button
// TODO: Change the return button to blue Done button
// TOOD: Highlight textfields red or green after input
// TODO: Link up to Firestore
// TODO: Check if there are any errors with registration form


//Some useful code for later
//Conditional use of views

//@ViewBuilder
//var body: some View {
//    if user.isLoggedIn {
//        MainView()
//    } else {
//        LoginView()
//    }
//}
import SwiftUI
//import KeyboardAvoider
import Foundation

struct RegisterViewController: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var passwordcheck : String = ""
    @State private var username : String = ""
    @State private var lastname : String = ""
    @State private var firstname : String = ""
    @State private var age : String = ""
    @State private var gender : String = ""
    @State private var birthdate = Date()
    @State private var validEmail : Bool = false
    @State private var invalidEmail : Bool = false
    @State private var validPassword : Bool = false
    @State private var invalidPassword : Bool = false
    @State private var passwordsMatch : Bool = false
    @State private var passwordsNotMatch : Bool = false
    
    @State private var validationIncomplete : Bool = false
    
    //    @State private var testingBoolean : Bool = false
    @State private var selection : Int? = nil
    var genders : [String] = ["M", "F"]
    
    //form validation
    func validateFields() -> Bool {
        
        if lastname.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if firstname.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        }
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if passwordcheck.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if username.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        if gender.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return false
        }
        
        let cleanedPassword = passwordcheck.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidPassword(cleanedPassword) == false {
            return false
        }
        
        return true
    }
    
    var body: some View {
        KeyboardHost{
            VStack {
                NavigationView{
                    VStack {
                        Logo()
                        Form {
                            Section {
                                TextField("Last Name", text: $lastname)
                                    .border(Utilities.isBlank(self.lastname) ? Color.clear : Color.blue)
                            }
                            Section {
                                TextField("First Name", text: $firstname)
                                    .border(Utilities.isBlank(self.firstname) ? Color.clear : Color.blue)
                            }
                            Section {
                                TextField("email@domain.com", text: $email) {
                                    if Utilities.isValidEmail(self.email) == false{
                                        self.invalidEmail = true
                                    }else {
                                        self.validEmail = true
                                    }
                                }
                                .border(invalidEmail ? Color.red : Color.clear)
                                .border(validEmail ? Color.blue : Color.clear)
                                .alert(isPresented: $invalidEmail) {
                                    Alert(title: Text("Invalid Email"), message: Text("Please check your email address"))
                                }
                            }
                            Section {
                                SecureField("Password", text: $password) {
                                    if Utilities.isValidPassword(self.password) == false{
                                        self.invalidPassword = true
                                    }else {
                                        self.validPassword = true
                                    }
                                }
                                .border(invalidPassword ? Color.red : Color.clear)
                                .border(validPassword ? Color.blue : Color.clear)
                                .textContentType(.oneTimeCode)
                                .alert(isPresented: $invalidPassword) {
                                    Alert(title: Text("Invalid Password"), message: Text("Please make sure your password is at least 8 characters, contains a special character and a number"))
                                }
                            }
                            Section {
                                SecureField("Check Password", text: $passwordcheck) {
                                    if Utilities.matchPasswords(self.password, self.passwordcheck) == false{
                                        self.passwordsNotMatch = true
                                    }else {
                                        self.passwordsMatch = true
                                    }
                                }
                                .border(passwordsNotMatch ? Color.red : Color.clear)
                                .border(passwordsMatch ? Color.blue : Color.clear)
                                .textContentType(.oneTimeCode)
                                .alert(isPresented: $passwordsNotMatch) {
                                    Alert(title: Text("Passwords do not match"), message: Text("Please check your password"))
                                }
                            }
                            Section {
                                TextField("Username", text: $username)
                                    .border(Utilities.isBlank(self.username) ? Color.clear : Color.blue)
                            }
                            Section {
                                DatePicker(selection:$birthdate,displayedComponents: .date, label: 
                                    { Text("Birthdate") })
                            }
                            // FIX: Not able to press gender again after picking a gender once
                            Section {
                                Picker(selection: $gender, label: Text("Gender")) {
                                    ForEach(genders, id : \.self) { (string:String) in
                                        Text(string)
                                    }
                                }
                                //check if all data is valid and add to database as a user
                            }
                            //need to add function that will take the user to home page
                            //add new data to the database
                        }
                        HStack {
                            //                    if self.validateFields(){
                            NavigationLink(destination: LogInViewController(), tag: 1, selection: $selection){
                                EmptyView()
                                Button(action: {
                                    //call validateFields() again and if returns true
                                    //add to database
                                    //navigate to home screen
                                    //if returns false
                                    //call an alert
                                    print("Testing")
                                    if self.validateFields() {
                                        self.validationIncomplete = false
                                        self.selection = 1
                                    }else {
                                        self.validationIncomplete = true
                                        //maybe add an alert here
                                        print("error")
                                    }
                                    
                                }) {
                                    HStack(alignment: .center) {
                                        Spacer()
                                        Text("Sign Up").foregroundColor(Color.white).bold()
                                        Spacer()
                                    }
                                }.padding()
                                    .background(self.validateFields()
                                        ? Color.blue : Color.gray)
                                    .cornerRadius(4.0)
                                    .alert(isPresented: $validationIncomplete) {
                                        Alert(title: Text("Incomplete form"), message: Text("Please fill in all fields"))
                                }
                                
                            }
                            .padding(.horizontal, 10.0)
                            //                    }
                        }
                        
                        
                    }
                }.gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                //sign up button
                //used conditional inside HStack to show sign up button only when validation is completed
            }
        }
    }
}

struct RegisterViewController_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewController()
    }
}
