//
//  MyPageViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/18.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct MyPageViewController: View {

    @State private var username : String = "olaf"
    @State private var fullname : String = "방준석"
    @State private var rank : String = "Bishop"
    

    var body: some View {
        VStack {
            CircleImage(image: Image("testProfile") )
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
            
        }
        
        
    }
}

struct MyPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        MyPageViewController()
    }
}
