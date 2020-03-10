//
//  NavigationTab.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/22.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct NavigationTab: View {
    var body: some View {
        //        NavigationView {
        HStack(alignment: .top) {
            NavigationLink(destination: FeedViewController()) {
                Image(systemName: "house")
                    .font(.system(size: 20, weight: .medium))
                    .padding(.leading)
            }
            
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20, weight: .medium))
            Spacer()
            NavigationLink(destination: NewReview()) {
                Image(systemName: "plus.app")
                .font(.system(size: 20, weight: .medium))
            }
            Spacer()
            NavigationLink(destination: MyPageViewController()) {
                Image(systemName: "person.circle")
                    .font(.system(size: 20, weight: .medium))
                    .padding(.trailing)
            }
        }
        //        }
        //        .navigationBarTitle("Hidden Title")
        //        .navigationBarHidden(true)
        //                .frame(height: 50)
        //        .padding(.top, -100)
        
    }
}

struct NavigationTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTab()
    }
}
