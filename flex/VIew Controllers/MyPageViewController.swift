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
import WaterfallGrid

struct MyPageViewController: View {
    
    
    @State private var username : String = "olaf"
    @State private var fullname : String = "방준석"
    @State private var rank : String = "Bishop"
    
    @State private var selection : Int? = nil
    
    
    var body: some View {
        NavigationView {
            VStack {
                CircleImage(image: Image("testProfile") )
                    .aspectRatio(contentMode: .fit)
                Text("aldsfjalksdjflkajdslfj")
                    .font(.title)
                    .padding()
                HStack {
                    Text("Rank")
                    Spacer()
                    Text("1,234 Votes")
                    Spacer()
                    Text("Followed by 2433")
                }
                Divider()
                TimelineView()
                
                NavigationTab()
            }
            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(true)
        }
        
    }
}
struct MyPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        MyPageViewController()
    }
}
