//
//  PopoverView.swift
//  flex
//
//  Created by Jun suk Bang on 2020/03/21.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct PopoverView: View {
     @State var showingPopover = false

     var body: some View {
       Button(action: {
         self.showingPopover = true
       }) {
         Text("Show new view")
       }.popover(isPresented: $showingPopover){
        VStack {
            HStack {
              Text("")
            }.frame(width: 500, height: 200)
                .background(Color.gray)
                .blur(radius: 10)
//              .background(Color.blue)
            HStack {
              Text("New Popover")
            }.frame(width: 500, height: 500)
//              .background(Color.red)
            HStack {
              Text("")
            }.frame(width: 500, height: 200)
                .blur(radius: 1)
//              .background(Color.green)
        }
         
       }
     }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
