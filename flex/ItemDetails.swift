//
//  ItemDetails.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct ItemDetails: View {
    var body: some View {
        VStack {
            BackgroundImage(image: Image("nikelogo"))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 400)
            CircleImage(image: Image("sacai") )
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            VStack {
                Text("Nike x Sacai")
                    .font(.title)
                Text("LDV Waffle")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                }
        .padding()
        Spacer()
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails()
    }
}
