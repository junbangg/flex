import SwiftUI

// TODO: - Plus button is awkward when always in the view, change so that when editing, a floatable button hovers above horizontal view

//TODO: - 댓글창 float  or  fixed  결정
//TODO: - Add functionality to add button so new review form is created upon press

struct ReviewCard_Edit: View {
    
    @State private var sizeRating : Int = 0
    @State private var comfortRating : Int = 0
    @State private var designRating : Int = 0
    @State private var qualityRating : Int = 0
    @State private var detailedView : Int = 0
    @State private var mixAndmatch : Int = 0
    @State private var headTurning : Int = 0
    
    @State private var brandName : String = ""
    @State private var productName : String = ""
    @State private var testReview : String = ""
    @State private var testVotes : Int = 365
    
    @State var categoryChoice = 0
    var categorys = ["상의", "하의", "신발", "악세사리","기타"]
    
    
    @State var versionChoice = 0
    var versions = ["Outfit", "Review"]
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
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
        
        //        NavigationView {
        VStack {
            //review
            ScrollView {
                // MARK: - 기본정보
                VStack {
                    VStack {
                        Picker("Category", selection: $categoryChoice) {
                            ForEach(0 ..< categorys.count) { index in
                                Text(self.categorys[index])
                                    .tag(index)
                            }
                            
                        }.pickerStyle(SegmentedPickerStyle())
                        
                        Spacer()
                        TextField("브랜드명", text: $brandName)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                            .padding(.horizontal)
                            .offset(y:20)
                        Spacer()
                        TextField("제품명", text: $productName)
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
                        
                    }
                    
                    //                        Spacer()
                    
                    //                        Spacer()
                    ScrollView(.horizontal) {
                        Spacer()
                        HStack {
                            RatingForm_Edit(category: "Sizing", sizeRating: $sizeRating, testReview: $testReview).padding(.top, 20)
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                .padding(.horizontal)
                            //                            .offset(y:40)
                        }
                        Spacer()
                    }
                    .offset(y:30)
                    
                    //                        Spacer()
                    
                }
                
            }
            
            
            
        }
        .navigationBarTitle("Add Review", displayMode: .inline)
        
        //        }
        //        .navigationBarTitle("olafo0o", displayMode: .inline)
        
        //        .navigationViewStyle(StackNavigationViewStyle())
        //
        //        .navigationBarTitle("Hidden Title")
        //        .navigationBarHidden(true)
    }
    
}
