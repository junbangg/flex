//
//  AddCard.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/27.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct AddCard: View {
    var body: some View {
        //        VStack {
        //            Divider()
        
        Image(systemName: "plus.circle")
            .font(.system(size: 75, weight: .ultraLight))
            .foregroundColor(Color.gray)
            .padding(.trailing)
        //            Divider()
        //        }
        
    }
}

struct AddCard_Previews: PreviewProvider {
    static var previews: some View {
        AddCard()
    }
}
