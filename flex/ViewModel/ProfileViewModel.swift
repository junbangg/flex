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
import SwiftKeychainWrapper

//maybe remove Identifiable protocol?
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
        let accessToken: String? = "Bearer " + KeychainWrapper.standard.string(forKey: "accessToken")!
        let userID: Int? = KeychainWrapper.standard.integer(forKey: "userID")!
        dataFetcher
            .getUserData(userID: userID!, token: accessToken!)
            .map(ProfileDataViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                    print("failed to refresh data")
                case .finished:
                    break
                }
                }, receiveValue: {
                    [weak self] result in
                    guard let self = self else { return }
                    print("profile appeared")
                    self.dataSource = result
                    print(result)
            })
            .store(in: &disposables)
        
    }
}

//extension ProfileViewModel {
//    var goToProfile: some View {
//        return ViewFactory.makeProfileView(dataSource: dataSource!)
//    }
//}
