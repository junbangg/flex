//
//  CircleImage.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI



struct CircleImage: View {
    var image : Image
    
    var body: some View {
        image
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(MyColors.lightGreyColor, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image : Image("sacai"))
    }
}
