//
//  TimelineView.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/20.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import SwiftUI

struct TimelineView: View {
    @State private var selection : Int? = nil
    
    let previews:[Preview] = [
        Preview(id: 0, imageUrl: "1"),
        Preview(id: 1, imageUrl: "2"),
        Preview(id: 2, imageUrl: "3"),
        Preview(id: 3, imageUrl: "4"),
        Preview(id: 4, imageUrl: "5"),
        Preview(id: 5, imageUrl: "6"),
        Preview(id: 6, imageUrl: "7")
//        Preview(id: 7, imageUrl: "8")
    ]
    
    var body: some View {
        //        NavigationView {
        ScrollView{
            VStack {
                ForEach(previews, id: \.id) { preview in
                    HStack {
                        LineView(previewArray: [preview])
                            .padding()
                        Spacer()
                        NavigationLink(destination: ItemDetails(), tag: 1, selection: self.$selection){
                            
                            Button(action: {
                                self.selection = 1
                            }) {
                                VStack {
                                    Text("Nike x Sacai")
                                        .font(.title)
                                    Text("LDV Waffle")
                                        .font(.headline)
                                }
                                Spacer()
                                Text("4.5")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.yellow)
                                    .padding()
                            }
                        }
                        
                        //Review Summary
                        
                    }
                    
                    
                }
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

struct Preview {
    var id: Int
    let imageUrl: String
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
