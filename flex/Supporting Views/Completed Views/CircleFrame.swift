//
//  CircleFrame.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct CircleFrame: View {
    var body: some View {
        Circle()
            .stroke(Color.white, lineWidth: 4)
            .shadow(radius: 10)
    }
}

struct CircleFrame_Previews: PreviewProvider {
    static var previews: some View {
        CircleFrame()
    }
}
