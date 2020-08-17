//
//  AWSNetwork.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation
import AWSS3
import AWSCognito

class AWSNetwork {
    static let shared = AWSNetwork()
    private init () {}
    let bucketName = "heatcheck-data"
    
    func uploadImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            let error = NSError(domain: "", code: 402, userInfo: [NSLocalizedDescriptionKey: "invalid image"])
//            completion?(nil,error)
            print(error)
            return
        }
        let tmpPath = NSTemporaryDirectory() as String
        let fileName : String = ProcessInfo.processInfo.globallyUniqueString
        let filePath = tmpPath + "/" + fileName
        let fileType : String = ".jpeg"
        let fileURL = URL(fileURLWithPath: filePath)
        
        do {
            try imageData.write(to: fileURL)
            self.uploadFile(with: try! String(contentsOf: fileURL), type: fileType)
        } catch {
            let error = NSError(domain: "", code: 402, userInfo: [NSLocalizedDescriptionKey: "invalid image"])
//            completion?(nil, error)
            print(error)
        }
        
    }
    private func uploadFile(with resource: String, type: String) {   //1
        let key = "\(resource).\(type)"
        let localImagePath = Bundle.main.path(forResource: resource, ofType: type)!  //2
        let localImageUrl = URL(fileURLWithPath: localImagePath)
        
        let request = AWSS3TransferManagerUploadRequest()!
        request.bucket = bucketName  //3
        request.key = key  //4
        request.body = localImageUrl
        request.acl = .publicReadWrite  //5
        
        //6
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(request).continueWith(executor: AWSExecutor.mainThread()) { (task) -> Any? in
            if let error = task.error {
                print(error)
            }
            if task.result != nil {   //7
                print("Uploaded \(key)")
                //do any task
            }
            
            return nil
        }
        
    }
}



