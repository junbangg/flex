//
//  RectImage.swift
//  flex
//
//  Created by Jun suk Bang on 2020/04/19.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct RectImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct RectImage_Previews: PreviewProvider {
    static var previews: some View {
        RectImage(image: Image("sacai"))
    }
}
