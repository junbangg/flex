//
//  ViewBuilder.swift
//  flex
//
//  Created by Jun suk Bang on 2020/09/07.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

enum ViewFactory {
    static func makeRootView (
        dataFetcher: APIRequests
    )-> some View {
        let viewModel = ProfileViewModel(
            dataFetcher: dataFetcher
        )
        return RootViewController(viewModel: viewModel)
    }
    static func makeProfileView (
        dataSource : ProfileViewModel
    ) -> some View {
        return Profile(viewModel: dataSource)
    }
}
