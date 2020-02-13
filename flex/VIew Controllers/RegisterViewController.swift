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

// TODO: Change the return button to blue Done button
// TODO: Navigation View from Login Screen -> this view]
// TODO: Password validation
// TODO: password matching
// TOOD: Highlight textfields red or green after input
// TODO: Link up to Firestore

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
    @State private var invalidEmail : Bool = false
    var genders : [String] = ["M", "F"]
    
    //email validation
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    //password validation
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }

        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    var body: some View {
        KeyboardHost{
            NavigationView{
                VStack {
                    Logo()
                    Form {
                        Section {
                            TextField("Last Name", text: $lastname)
                        }
                        Section {
                            TextField("First Name", text: $firstname)
                        }
                        Section {
                            TextField("email@domain.com", text: $email) {
                                if self.isValidEmail(email: self.email) == false{
                                    self.invalidEmail = true
                                }
                            }
                            .alert(isPresented: $invalidEmail) {
                            Alert(title: Text("Invalid Email"), message: Text("Please check your email address"))
                                
                                
//                                if self.isValidEmail(email: self.lastname){
//                                    //add alert to user
//                                    //highlight the textfields accordingly
//                                    print("Correct Email Format")
//
//                                }else {
//                                    print("Wrong email format")
//                                }
                                
                            }
                        }
                        Section {
                            SecureField("Password", text: $password)
                        }
                        Section {
                            SecureField("Check Password", text: $passwordcheck)
                        }
                        Section {
                            TextField("Username", text: $username)
                        }
                        Section {
                            DatePicker(selection:$birthdate,displayedComponents: .date, label: { Text("Birthdate") })
                        }
                        // FIX: Not able to press gender again after picking a gender once
                        Section {
                            Picker(selection: $gender, label: Text("Gender")) {
                                ForEach(genders, id : \.self) { (string:String) in
                                    Text(string)
                            }
                        }
                    }
                }
            }
        }.gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
        }
    }
}
//View for moving keyboard
struct KeyboardHost<Content: View>: View {
    let view: Content

    @State private var keyboardHeight: CGFloat = 0

    private let showPublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillShowNotification
    ).map { (notification) -> CGFloat in
        if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            return rect.size.height
        } else {
            return 0
        }
    }

    private let hidePublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillHideNotification
    ).map {_ -> CGFloat in 0}

    // Like HStack or VStack, the only parameter is the view that this view should layout.
    // (It takes one view rather than the multiple views that Stacks can take)
    init(@ViewBuilder content: () -> Content) {
        view = content()
    }

    var body: some View {
        VStack {
            view
            Rectangle()
                .frame(height: keyboardHeight)
                .animation(.default)
                .foregroundColor(.clear)
            }.onReceive(showPublisher.merge(with: hidePublisher)) { (height) in
            self.keyboardHeight = height
        }
    }
}


struct RegisterViewController_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewController()
    }
}

