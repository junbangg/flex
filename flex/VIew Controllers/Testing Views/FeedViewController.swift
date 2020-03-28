//
//  FeedViewController.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct FeedViewController: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ReviewCard()
                Spacer()
                ReviewCardThree()
                Spacer()
                ReviewCardTwo()
                Spacer()
                ReviewCardFour()
                //                NavigationTab()
                FloatingNavigationTab()
            }
            
        }
        .navigationBarTitle("Hidden Title")
        .navigationBarHidden(true)
        
    }
}

struct FeedViewController_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewController()
    }
}
