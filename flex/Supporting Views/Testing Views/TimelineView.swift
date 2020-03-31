//
//  TimelineView.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/20.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct TimelineView: View {
    
    //    var productName : String
    
    let previews:[Preview] = [
        Preview(id: 0, imageUrl: "1", product: Product(brandName: "Nike x Sacai", productName: "LDV Waffle")),
        Preview(id: 1, imageUrl: "2", product: Product(brandName: "Nike x ACW", productName: "Zoom Vomero 5")),
        Preview(id: 2, imageUrl: "3", product: Product(brandName: "Acne Studios", productName: "Non-collar")),
        Preview(id: 3, imageUrl: "4", product: Product(brandName: "New Balance", productName: "V4")),
        Preview(id: 4, imageUrl: "5", product: Product(brandName: "Nike", productName: "Air Max 97"))
        //        Preview(id: 5, imageUrl: "6"),
        //        Preview(id: 6, imageUrl: "7")
        //        Preview(id: 7, imageUrl: "8")
    ]
    
    var body: some View {
        //        NavigationView {
        ScrollView{
            VStack {
                ForEach(previews, id: \.id) { preview in
                    VStack {
                        HStack {
                            LineView(previewArray: [preview])
                                .padding()
                            Spacer()
                            NavigationLink(destination: ItemDetails()) {
                                VStack {
                                     Text(preview.brandToString())
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(preview.productNameToString())
                                        .font(.headline)
                                        .multilineTextAlignment(.center)
                                }
                                Spacer()
                                Text("4.5")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.yellow)
                                    .padding()
                            }
                        }
                        Divider()
                    }
                }
                NavigationLink(destination: ReviewCard_Edit()) {
                    AddCard()
                    .padding(.vertical, 30.0)
                }
                
                
                Divider()
            }
        }
        //        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
struct Product {
    let brandName : String
    let productName : String
}
struct Preview {
    var id: Int
    let imageUrl: String
    let product: Product
    
    func brandToString() -> String {
        return product.brandName
    }
    func productNameToString() -> String {
        return product.productName
    }
}

struct LineView: View {
    let previewArray:[Preview]
    
    var body: some View {
        HStack(spacing: 2){
            PreviewView(preview: previewArray[0])
            //            PreviewView(preview: previewArray[1])
            //            PreviewView(preview: previewArray[2])
        }
    }
}

struct PreviewView: View {
    
    let preview: Preview
    
    var body: some View {
        //Circle Image Version
        CircleImage(image: Image(preview.imageUrl) )
            .frame(width: 136, height: 136)
        //Rectangular Version
        //        Image(preview.imageUrl)
        //            .resizable()
        //            .frame(width: 136, height: 136)
    }
}
