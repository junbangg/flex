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


struct MyPageViewController: View {
    
    
    @State private var username : String = "olaf"
    @State private var fullname : String = "방준석"
    @State private var rank : String = "Bishop"
    
    @State private var selection : Int? = nil
    
    
    var body: some View {
        NavigationView {
            VStack {
                //                ScrollView {
                VStack {
                    CircleImage(image: Image("testProfile") )
                        .frame(width: 200, height:200)
                        .aspectRatio(contentMode: .fit)
                    Text(username)
                        .font(.title)
                        .padding()
                    HStack {
                        VStack {
                            Text("Rank")
                                .font(.headline)
                            //                            .foregroundColor(Color.red)
                            Text("Gold"
                            ).foregroundColor(Color.yellow)
                        }
                        .padding(.leading)
                        Spacer()
                        VStack {
                            Text("Flames")
                                .font(.headline)
                            //                            .foregroundColor(Color.red)
                            Text("365").foregroundColor(Color.gray)
                        }
                        .padding(.leading, 30.0)
                        Spacer()
                        VStack {
                            Text("Followers")
                                .font(.headline)
                            //                            .foregroundColor(Color.red)
                            Text("1234")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.trailing)
                    }
                    Divider()
                    
                    //                TimelineView()
                    UsersItems()
                }
                    
                    
                
                //                }
                FloatingNavigationTab()
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
