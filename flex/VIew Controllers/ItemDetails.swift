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
 -figure out how to add button that will lead to the detailed review page(maybe swipe for detailed review)
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
    
    @State private var testReview : String = ""
    @State private var testVotes : Int = 365
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    func compute() -> String{
        var sum = 0
        var mean : Float
        let denominator = 6
        
        sum = sizeRating + comfortRating + designRating + qualityRating + mixAndmatch + headTurning
        mean = (Float(sum) / Float(denominator))
        return String(round(mean*10)/10)
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                BackgroundImage(image: Image("nikelogo"))
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 230)//400
                
                CircleImage(image: Image("sacai") )
                    .frame(width: 300, height: 300)
                    .offset(x: 0, y: -200) //-130
                    .padding(.bottom, -200)
                
                VStack {
                    Text("Nike x Sacai")
                        .font(.title)
                    Text("LDV Waffle")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                HStack {
                    Text(self.compute())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .padding(.leading)
                    
                    Spacer()
                    VStack {
                        Button(action: {self.testVotes += 1}) {
                            Text("Checked")
                        }.foregroundColor(Color.red)
                        Text("\(testVotes)").foregroundColor(Color.gray)
                    }
                    .padding(.trailing)
                }
                Divider()
                
                Spacer()
                ScrollView {
                    
                    RatingForm(category: "Sizing", sizeRating: $sizeRating, testReview: $testReview).padding(.top, 20)
                    RatingForm(category: "Comfort", sizeRating: $comfortRating, testReview: $testReview).padding(.top, 20)
                    RatingForm(category: "Design", sizeRating: $designRating, testReview: $testReview).padding(.top, 20)
                    RatingForm(category: "Quality",sizeRating: $qualityRating, testReview: $testReview).padding(.top, 20)
                    RatingForm(category: "Mix and Match",sizeRating: $mixAndmatch, testReview: $testReview).padding(.top, 20)
                    RatingForm(category: "Headturning",sizeRating: $headTurning, testReview: $testReview).padding(.top, 20)
                }
//                Spacer()
                NavigationTab()
                    .padding(.bottom)
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
        .navigationBarTitle("Hidden Title")
        .navigationBarHidden(true)
    }
    
}

//struct ItemDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetails()
//    }
//}
