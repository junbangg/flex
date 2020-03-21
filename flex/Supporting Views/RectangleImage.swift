//
//  RectangleImage.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct RectangleImage: View {
    var image : Image
    
    var body: some View {
        image
            .resizable()
            //            .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            
    }
}

struct RectangleImage_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImage(image : Image("outfit"))
    }
}
