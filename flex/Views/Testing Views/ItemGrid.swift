//
//  ContentView.swift
//  codeTutorial_gridCollectionView
//
//  Created by Christopher Guirguis on 3/31/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//
import SwiftUI

struct ItemGrid: View {
    
    let blank : [AnyView] = [AnyView(Image("blank")
        .resizable()
        .scaledToFill())]
    
    var contents:[AnyView] = [
           AnyView(Image("0")
               .resizable()
               .scaledToFill()),
           AnyView(Image("outfit")
           .resizable()
           .scaledToFill()),
           AnyView(Image("1")
           .resizable()
           .scaledToFill()),
           AnyView(Image("2")
           .resizable()
           .scaledToFill()),
           AnyView(Image("3")
           .resizable()
           .scaledToFill()),
           AnyView(Image("outfitTwo")
           .resizable()
           .scaledToFill()),
           AnyView(Image("4")
           .resizable()
           .scaledToFill()),
           AnyView(Image("5")
           .resizable()
           .scaledToFill()),
           AnyView(Image("sacai")
           .resizable()
           .scaledToFill()),
           AnyView(Image("testProfile")
           .resizable()
           .scaledToFill())
       ]
    var itemsPerRow = 3
    
    var body: some View {
        ScrollView{
            VStack(spacing:0){
            ForEach(0..<getRowCount(numerator: contents.count, denominator: itemsPerRow)) {i in
                RowView(itemPerRow: 3, contents: self.getRowContent(rowNumber: i, itemsPerRow: self.itemsPerRow))
                }
            }
        }
    }
    
    func getRowCount(numerator: Int, denominator: Int) -> Int {
        if numerator % denominator == 0 {
            return (numerator/denominator)
        } else {
            return (numerator/denominator) + 1
        }
    }
    
    func getRowContent(rowNumber:Int, itemsPerRow:Int) -> [AnyView] {
        var returnItems:[AnyView] = []
        for i in 0..<itemsPerRow {
            let itemIndex = (rowNumber * itemsPerRow) + i
            if itemIndex > contents.count{

//                returnItems.append(blank[0])

            }
            else if itemIndex < contents.count {

                returnItems.append(contents[itemIndex])

            }
        }
        return returnItems
        
    }
}

struct RowView: View {
    
    var itemPerRow:CGFloat
    var contents:[AnyView]
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<contents.count){i in
                self.contents[i]
                .frame(
                    width: UIScreen.main.bounds.width/self.itemPerRow ,
                    height: UIScreen.main.bounds.width/self.itemPerRow
                )
                .clipped()
                .background(Color.blue)
                
            }
        }
    }
}
struct ItemGrid_Previews: PreviewProvider {
    static var previews: some View {
        ItemGrid()
    }
}
