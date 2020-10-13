//
//  LoginViewModel.swift
//  flex
//
//  Created by Jun suk Bang on 2020/09/05.
//  Copyright © 2020 Jun Bang. All rights reserved.
//
import SwiftUI
import Foundation
import Combine

class LoginViewModel: ObservableObject {//Identifiable
    @Published var dataSource : ProfileDataViewModel?
    private let dataFetcher: APIRequests
    private var disposables = Set<AnyCancellable>()
    
    init(
        dataFetcher: APIRequests,
        scheduler: DispatchQueue = DispatchQueue(label: "LoginViewModel")
    ) {
        self.dataFetcher = dataFetcher
    }
    // MARK: -Login Request
    func loginRequest(email: String, password: String) {
        dataFetcher
            .login(email: email, password: password)
            .map(ProfileDataViewModel.init)
//            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else {return}
                switch value {
                case .failure:
                    print(value)
                    self.dataSource = nil
                case .finished:
                    break
                }
                }, receiveValue: { [weak self] result in
                    guard let self = self else {return}
                    self.dataSource = result
//                    print(self.dataSource!.status as Int)
//                    print(self.dataSource!.token)
            })
            .store(in: &disposables)
    }
}

extension LoginViewModel {
    var goToRoot: some View {
        return ViewFactory.makeRootView(dataFetcher: dataFetcher)
    }
}
