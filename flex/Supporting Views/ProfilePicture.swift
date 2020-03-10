//
//  ProfilePicture.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ProfilePicture: View {
    var body: some View {
        CircleImage(image: Image("testProfile") )
            .frame(width: 200, height:200)
            .aspectRatio(contentMode: .fit)
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
