//
//  UserInfo.swift
//  flex
//
//  Created by Jun suk Bang on 2020/04/19.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        HStack {
            RectImage(image: Image("testProfile") )
                .frame(width: 100, height:100)
                .aspectRatio(contentMode: .fit)
            Text("olafo0o")
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
                //                Spacer()
                VStack {
                    Image(systemName: "flame")
                        .foregroundColor(Color.red)
                        .font(.system(size: 20, weight: .medium))
                    
                    //                            .foregroundColor(Color.red)
                    Text("533")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fixedSize()
                        .frame(width:20)
                        .foregroundColor(Color.red)
//                    Text("365").foregroundColor(Color.gray)
                }
                .padding(.leading, 30.0)
                //                Spacer()
                //                VStack {
                //                    Text("Followers")
                //                        .font(.headline)
                //                    //                            .foregroundColor(Color.red)
                //                    Text("1234")
                //                        .foregroundColor(Color.gray)
                //                }
                //                .padding(.trailing)
            }
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
