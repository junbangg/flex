//
//  MyPageViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/18.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct MyPageViewController: View {
    var body: some View {
        VStack {
            HStack {
                CircleImage(image: Image("testProfile") )
                        .offset(x: -50, y: 0)
//                    .padding(.bottom, -130)
                VStack {
                    Text("olafo0o")
                        .font(.title)
//                    Text("Fasion Enthusiast, Ice Cream Lover")
                }
            }
            
            
//            Spacer()
//                Text("Fasion Passion")
//                    .font(.headline)
//                    .multilineTextAlignment(.center)
            
//            .padding()
            //            Spacer()
            
            Spacer()
        }
    }
}

struct MyPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        MyPageViewController()
    }
}
