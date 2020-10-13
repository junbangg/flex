//
//  ProfileViewModel.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//
import SwiftUI
import Foundation
import Combine
//maybe add Identifiable protocol?
class ProfileViewModel: ObservableObject, Identifiable {
    @Published var dataSource : ProfileDataViewModel?
    
    private let dataFetcher : APIRequests
    private var disposables = Set<AnyCancellable>()
    
    init(
        dataFetcher: APIRequests,
        scheduler: DispatchQueue = DispatchQueue(label: "ProfileViewModel")
    ) {
        self.dataFetcher = dataFetcher
    }
    func refresh() {
        dataFetcher
            .getUserData(userID: 25)
            .map(ProfileDataViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                [weak self] value in
                guard let self = self else { return }
                //                value in
                switch value {
                case .failure:
                    self.dataSource = nil
//                    print("failed to refresh data")
                case .finished:
                    break
                }
                }, receiveValue: {
                    [weak self] result in
                    guard let self = self else { return }
                    //                    result in
                    print("profile appeared")
                    self.dataSource = result
            })
            .store(in: &disposables)
        
    }
}

//extension ProfileViewModel {
//    var goToProfile: some View {
//        return ViewFactory.makeProfileView(dataSource: dataSource!)
//    }
//}