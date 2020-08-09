//
//  ImagePicker.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/06.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI


struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isPresented : Bool
    @Binding var selectedImage : UIImage
    @Binding var isSelected : Bool
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->
    UIViewController{
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    //important part
    func makeCoordinator() -> ImagePicker.Coordinator {
        return Coordinator(parent: self)
    }
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent : ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage{
                print(selectedImageFromPicker)
                self.parent.selectedImage = selectedImageFromPicker
                self.parent.isSelected = true
            }
            self.parent.isPresented = false
        }
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
