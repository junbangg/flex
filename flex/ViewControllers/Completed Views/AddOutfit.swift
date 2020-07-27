//
//  AddOutfit.swift
//  flex
//
//  Created by Jun suk Bang on 2020/07/20.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct AddOutfit: View {
    @State var outer : String = ""
    @State var top : String = ""
    @State var bottom : String = ""
    @State var shoe : String = ""
    @State var accessory : String = ""
    
    @State var isShowingImagePicker = false
    @State var outfitImage = UIImage()
    @State var imageSelected = false
    var body: some View {
            
            ScrollView {
                if imageSelected == false {
                    Button(action: {
                        self.isShowingImagePicker.toggle()
                    }) {
                        Text("이미지 추가")
//                        Image(systemName:"plus")
//                            .font(.system(size:30, weight:.medium))
                    }
                    .padding(.top, 200)
                    .padding(.bottom, 200)
                    .sheet(isPresented: self.$isShowingImagePicker, content: {
                        ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$outfitImage, isSelected: self.$imageSelected)
                    })
                }else {
                    ZStack {
                        RectangleImage(image: Image(uiImage:outfitImage))
                            .frame(width: UIScreen.screenWidth, height: 600)
                        Button(action: {
                            self.isShowingImagePicker.toggle()
                        }) {
                            Text("이미지 바꾸기")
                        }
                        .padding(.top)
                        .padding(.bottom)
                        .sheet(isPresented: self.$isShowingImagePicker, content: {
                            ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$outfitImage, isSelected: self.$imageSelected)
                        })
                        
                    }
                }
                
                //info
                VStack {
                    TextField("아우터", text: self.$outer)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .offset(y:10)
                    TextField("상의", text: self.$top)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .offset(y:30)
                    TextField("하의",text: self.$bottom)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .offset(y:50)
                    TextField("신발", text: self.$shoe)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .offset(y:70)
                    TextField("악세사리", text: self.$accessory)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .offset(y:90)
                }
                .padding(.bottom, 100)
            }
        .navigationBarTitle("Add Outfit", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action : {
                print("save pressed")
            }) {
                Text("Save")
            }
        )
    }
}
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
struct AddOutfit_Previews: PreviewProvider {
    static var previews: some View {
        AddOutfit()
    }
}
