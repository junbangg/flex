//
//  ItemDetails.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//
/*
 Issues:
 -Need to change this view so that the star ratings are fixed and can only be edited by the user
 -Create an editing version of this view
 -Need to decide on 5 perfectly balanced rating criteria
 -figure out how to add button that will lead to the detailed review page
 */
import SwiftUI

struct ItemDetails: View {
    
    @State private var sizeRating : Int = 0
    @State private var comfortRating : Int = 0
    @State private var designRating : Int = 0
    @State private var qualityRating : Int = 0
    @State private var detailedView : Int = 0
    @State private var mixAndmatch : Int = 0
    @State private var headTurning : Int = 0
    
    func compute() -> String{
        var sum = 0
        var mean : Float
        let denominator = 6
        
        sum = sizeRating + comfortRating + designRating + qualityRating + mixAndmatch + headTurning
        mean = (Float(sum) / Float(denominator))
        return String(round(mean*10)/10)
    }
    
    var body: some View {
        VStack {
            BackgroundImage(image: Image("nikelogo"))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)//400
            
            CircleImage(image: Image("sacai") )
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            VStack {
                Text("Nike x Sacai")
                    .font(.title)
                Text("LDV Waffle")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            //            Spacer()
            
            Text(self.compute())
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            
            Spacer()
            ScrollView {
           
                HStack {
                    Spacer()
                    VStack {
                        Text("Sizing")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $sizeRating)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Comfort")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $comfortRating)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Design")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $designRating)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Quality")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $qualityRating)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Mix n Match")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $mixAndmatch)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Headturning")
                        //                        .font(.headline)
                        //                        .multilineTextAlignment(.center)
                        RatingView(rating: $headTurning)
                    }
                    Spacer()
                }
                
            
            }
            
            Spacer()
        }
//        HStack {
//            NavigationLink(destination: LogInViewController(), tag: 1, selection: $detailedView){
//                EmptyView()
//                Button(action: {
//                    self.detailedView = 1
//                }) {
//                    Text("Detailed Review")
//                }
//            }
//        }
        
    }
}

//struct ItemDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetails()
//    }
//}
