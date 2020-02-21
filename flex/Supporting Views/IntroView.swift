//
//  IntroView.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/18.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct IntroView: View {
//    var username : String
//    var fullName : String
//    var rank : String
    var body: some View {
        
//        VStack {
//            Text(username)
//                .font(.title)
//                .padding()
//            HStack {
//                Text(fullName)
//                    .multilineTextAlignment(.leading)
//                Spacer()
//                Text("Rank : " + rank)
//
//            }
//
//        }
        WaterfallGrid((0..<10), id: \.self) { index in
          Image("image\(index)")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
    }
}

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView(username: "olafo0o", fullName: "방준석", rank : "Bishop")
//    }
//}
