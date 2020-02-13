//
//  Logo.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Text("flex")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.red)
            .offset(x:0, y:-30)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
