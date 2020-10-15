//
//  AWSS3Manager.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/10.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation
import SwiftUI
import AWSS3
import SwiftKeychainWrapper

typealias progressBlock = (_ progress: Double) -> Void
typealias completionBlock = (_ response: Any?, _ error: Error?) -> Void

class AWSS3Manager {
    static let shared = AWSS3Manager()
    private init () {}
    let bucketName = "heatshare"
    
    //MARK: -Upload UIImage
    func uploadImage(image: UIImage, progress: progressBlock?, completion: completionBlock?) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            let error = NSError(domain: "", code: 402, userInfo: [NSLocalizedDescriptionKey: "invalid image"])
            completion?(nil,error)
            print(error)
            return
        }
        let tmpPath = NSTemporaryDirectory() as String
        let fileName : String = ProcessInfo.processInfo.globallyUniqueString + (".jpeg")
        let filePath = tmpPath + "/" + fileName
        let fileURL = URL(fileURLWithPath: filePath)
        //saved image url to keychain
        let _: Bool = KeychainWrapper.standard.set(filePath, forKey: "profileImage")

        do {
            try imageData.write(to: fileURL)
            self.uploadFile(fileURL: fileURL, fileName: fileName, contentType: "image", progress: progress, completion: completion)
        } catch {
            let error = NSError(domain: "", code: 402, userInfo: [NSLocalizedDescriptionKey: "invalid image"])
            completion?(nil, error)
        }

    }
    //MARK: -Upload file to AWS
    /*
     fileURL : file local path url
     fileName: name of file  "image.jpeg"
     contentType: file MIME type
     */
    private func uploadFile(fileURL: URL, fileName: String, contentType: String, progress: progressBlock?, completion: completionBlock?) {
        //Upload progress block
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, awsprogress) in
            print(awsprogress.fractionCompleted)
            if awsprogress.isFinished{
                print("Upload finished...")
            }
            //            guard let uploadProgress = progress else { return }
            //            DispatchQueue.main.async(execute: {
            //                uploadProgress(awsprogress.fractionCompleted)
            //            })
        }
//        expression.setValue("public-read-write", forRequestHeader: "x-amz-acl")
//        expression.setValue("public-read-write", forRequestParameter: "x-amz-acl")
        //Completion block
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { (task,error) -> Void in
            //            DispatchQueue.main.async(execute: {
            if error == nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent(self.bucketName).appendingPathComponent(fileName)
                print("Uploaded to \(String(describing: publicURL))")
                if let completionBlock = completion {
                    completionBlock(publicURL?.absoluteString, nil)
                }
            }else {
                if let completionBlock = completion {
                    completionBlock(nil, error)
                }
            }
        }
        //Start uploading
        let awsTransferUtility = AWSS3TransferUtility.default()
        awsTransferUtility.uploadFile(fileURL,bucket: bucketName, key: fileName, contentType: contentType, expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
            if let error = task.error {
                print("error is:\(error.localizedDescription)")
            }
            if let _ = task.result {
                print("Starting upload...")
            }
            return nil
        }
    }
    
}
