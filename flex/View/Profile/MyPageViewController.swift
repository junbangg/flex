//
//  MyPageViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/18.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//NavigationView {
//   List(todoItems) { todoItem in
//      NavigationLink(destination: TodoDetailView(todoItem: todoItem)) {
//         Text(todoItem.action)
//      }
//   }.navigationBarTitle(Text("Todo Items"))
//}

import SwiftUI
import SwiftKeychainWrapper


struct MyPageViewController: View {
    
    
    @State private var username : String = "olaf"
    @State private var fullname : String = "방준석"
    @State private var rank : String = "Bishop"
    
    @State private var selection : Int? = nil
    
//    func loadData() {
//        if let token: String = KeychainWrapper.standard.string(forKey: "accessToken") {
//            let accessToken = token
//        }
//        if let id: Int = KeychainWrapper.standard.integer(forKey: "userID") {
//            let userID = id
//        }
//
//        //        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//        //        let userID : Int? = KeychainWrapper.standard.integer(forKey: "userID")
//        //        let userID : Int? = KeychainWrapper.standard.integer(forKey: "userID")
//        //get data
//
//
//        guard let myUrl = URL(string: "http://15.164.142.209:3001/api/reviews/review/12") else { return }
//
//        var components = URLComponents(url: myUrl, resolvingAgainstBaseURL: false)!
//
//        components.queryItems = [
//            URLQueryItem(name: "id", value: "12")
//        ]
//        let query = components.url!.query
//
//        var dataRequest = URLRequest(url: myUrl)
//        dataRequest.httpMethod = "GET"
//
//        dataRequest.httpBody = Data(query!.utf8)
//
//        let task = URLSession.shared.dataTask(with: dataRequest) { (data: Data?, response : URLResponse?, error: Error?) in
//
//            if let err = error {
//                print("Failed to load data:", err)
//                return
//            }
//            // MARK: - Receive JSON Data
//            do {
//                //parsed JSON into dictionary
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                if let parseJSON = json {
//
//                    print(parseJSON)
//                    //extracted result dictionary from whole JSON
//                    let result = parseJSON["result"] as? [String: AnyObject]
//                    //extracted profile dictionary from result dictionary
//                    let profile = result!["profile"] as? [String: AnyObject]
//                    //saved accessToken and userID
//                    let accessToken = result!["token"] as? String
//                    let userID = profile!["id"] as? Int
//                    //                                        print("Access Token: \(String(describing: accessToken!))")
//
//                    let saveAccessToken: Bool = KeychainWrapper.standard.set(accessToken!, forKey: "accessToken")
//                    let saveuserID: Bool = KeychainWrapper.standard.set(userID!, forKey: "userID")
//
//                    print("The access token save result: \(saveAccessToken)")
//                    print("The userID save sesult: \(saveuserID)")
//
//                    if accessToken == nil
//                    {
//                        print("error with access token")
//                        return
//                    }
//                    self.selection = 1
//                    print("Probably logged in successfully..")
//                    //
//
//                } else {
//                    print("something went wrong")
//                }
//            } catch {
//                print(error)
//            }
//
//        }
//        task.resume() // never forget this resume
//
//
//
//
//
//    }
    
    //git testing
    
    func loadData() {
        // Create URL
        let url = URL(string: "http://15.164.142.209:3001/api/reviews/review/12")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                //                ScrollView {
                VStack {
//                    UserInfo()
//                    Divider()
                    
//                    UsersItems()
                    // MARK: - List of Review Items
                    
                    /*SegmentedTab() is for segmented version of mypage. to disable, comment out SegmentedTab()
                                and uncomment above code*/
//                    Profile()
                    Text("Just to erase errors")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("Hidden Title")
        .navigationBarHidden(true)
    }
}
struct MyPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        MyPageViewController()
    }
}
