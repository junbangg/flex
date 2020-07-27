//
//  NextButton.swift
//  MemoChat
//
//  Created by Jun suk Bang on 2020/04/24.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

//let midnightBlue = Color(red: 153.0/255.0, green: 186.0/255.0, blue: 221/255.0)

struct ArrowButton: View {
    var body: some View {
        
        Image(systemName: "arrow.right")
            .font(.system(size:40, weight:.medium))
            .padding()
            .background(MyColors.ferrariRed)
            .clipShape(Circle())
            .foregroundColor(Color.white)
        
        
    }
}

struct ArrowButton_Previews: PreviewProvider {
    static var previews: some View {
        ArrowButton()
    }
}
