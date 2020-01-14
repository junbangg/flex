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
        Text("제품명")
            .font(.title)
            .multilineTextAlignment(.center)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails()
    }
}
