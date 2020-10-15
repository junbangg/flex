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
    //MARK: - Refreshes the profile data.
    func refresh() {
        let accessToken: String? = "Bearer " + KeychainWrapper.standard.string(forKey: "accessToken")!
        let userID: Int? = KeychainWrapper.standard.integer(forKey: "userID")!
        dataFetcher
            .getProfileData(userID: userID!, token: accessToken!)
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
                    let _: Bool = KeychainWrapper.standard.set(self.dataSource!.profileImage ?? "No Image", forKey: "profileImage")
                    print(result)
            })
            .store(in: &disposables)
        
    }
    
    //MARK: -Updates(saves) changes in MyProfile to database
    ///
    /// - Parameters:
    ///     - profileImage: UIImage that is currently on display in `MyProfile`
    ///     - intro: new intro String from` MyProfile`
    ///     - profileImageChanged: Boolean to check if the image has been updated. This will be used to determine whether or not the new profile_image string should be uploaded to AWS.
    
    func update(profileImage: UIImage, intro: String, profileImageChanged : Bool) {
        
        //MARK: -posts new profileImage string to AWS(if there was actually a change in profileImage)
        /// if image is changed(profileImage will not be nil) , upload image to AWS and and save the new url to keychain
        
        if profileImageChanged {
            AWSS3Manager.shared.uploadImage(image: profileImage, progress: {[self] ( uploadProgress) in
                
                print(Float(uploadProgress))
                
            }) {[self] (uploadedFileUrl, error) in
                
                //                    guard let strongSelf = self else { return }
                if let finalPath = uploadedFileUrl as? String { // 3
                    print(finalPath)
                } else {
                    print("\(String(describing: error?.localizedDescription))") // 4
                }
            }
        }
        /// if the image wasn't changed,  just access the old image url from keychain which was already updated when data was refreshed
        let accessToken: String? = "Bearer " + KeychainWrapper.standard.string(forKey: "accessToken")!
        let userID: Int? = KeychainWrapper.standard.integer(forKey: "userID")!
        let imageURL: String? = KeychainWrapper.standard.string(forKey: "profileImage")!
        //MARK: -calls update to database function from APINetworking class
        dataFetcher
            .updateProfileData(userID: userID!, token: accessToken!, profileImage: imageURL!, intro: intro)
//            .map(ProfileDataViewModel.init)
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] value in
//                guard let self = self else {return}
//                switch value {
//                case .failure:
//                    print(value)
//                    self.dataSource = nil
//                case .finished:
//                    break
//                }
//                }, receiveValue: { [weak self] result in
//                    guard let self = self else {return}
//                    self.dataSource = result
//            })
//            .store(in: &disposables)
        
    }
    
    
}

//extension ProfileViewModel {
//    var goToProfile: some View {
//        return ViewFactory.makeProfileView(dataSource: dataSource!)
//    }
//}
