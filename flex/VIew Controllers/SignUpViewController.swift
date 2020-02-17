//
//  SignUpViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/17.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI
import UIKit
import AnimatedField


struct SignUpViewController: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var username : String = ""
    @State private var lastname : String = ""
    @State private var firstname : String = ""
    @State private var age : String = ""
    @State private var gender : String = ""
//    @State private var birthdate = Date()
    @State var showDatePicker = false
    
    
    //changes date to string "supposedly"
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return formatter
//    }
    
    //function for making keyboard disappear
    func endEditing() {
        //UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        let keyWindow = UIApplication.shared.connectedScenes
                               .filter({$0.activationState == .foregroundActive})
                               .map({$0 as? UIWindowScene})
                               .compactMap({$0})
                               .first?.windows
                               .filter({$0.isKeyWindow}).first
                       keyWindow?.endEditing(true)

    }
    
//    func showPicker() {
//        Picker(selection: $gender, label: Text("Gender")) {
//        Text("M").tag(1)
//        Text("F").tag(2)
//        }
//    }
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing : 10.0) {
            //will change the logo
            Logo()
            
            Group {
                Text("Email")
                TextField("email@domain.com", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Password")
                TextField("asdf1234!@", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Username")
                TextField("bestflexer", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Last Name")
                TextField("Cambridge", text: $lastname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("First Name")
                TextField("Calvin", text: $firstname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Text("Age")
//                TextField("Age", text: $age)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 50.0)
            Text("Gender")
                .padding(.bottom, 10.0)
            
//            Button(action: {Picker(selection: self.$gender, label: Text("Gender")) {
//                Text("M").tag(1)
//                Text("F").tag(2)
//                }}) {
            Text("M/F")
                .foregroundColor(Color.gray)
                .overlay(
                    Capsule(style: .continuous)
                        .size(width:50, height:35)
                        .stroke(Color.gray, lineWidth : 1)
                        .offset(x:-10, y:-7)
                )
            }
        

            
//            NavigationView {
//                Form {
//                    Section {
//                        Picker(selection: $gender, label: Text("Gender")) {
//                            Text("M").tag(1)
//                            Text("F").tag(2)
//                            }
//                        }
//                    }
//                }.navigationBarTitle("Gender")

            }
            //TextField + Picker
//            TextField("M/F", text: $gender,onEditingChanged: {_ in self.showDatePicker = true
//                        })
//            {
//
//            }
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal, 185)
//            if self.showDatePicker {
//                Picker(selection: $gender, label: Text("Gender")) {
//                Text("M").tag(1)
//                Text("F").tag(2)
//                }
//                .onAppear{self.endEditing()}
//                .labelsHidden()
//            }

            //Date picker + TextField for Birthday
//            TextField("Month/Day/Year", text: "\(birthdate, formatter:dateFormatter)",onEditingChanged: {_ in
//                self.showDatePicker = true
////                (editting) in
////                self.showDatePicker = editting
//            })
//            {
//
//            }
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal, 50.0)
//            if self.showDatePicker {
//                DatePicker(selection: $birthdate, in: ...Date(), displayedComponents: .date) {
//                    Text("Birthday")
//                }
//                .onAppear{self.endEditing()}
//                .labelsHidden()
//            }
            
        }
        

struct SignUpViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewController()
    }
}

