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
    
    var categorys = ["상의", "하의", "신발", "악세사리","기타"]
    var sizes = ["220","225","230","235","240","245","250","255","260","265","270","275","280","285","290","295","300"]
    @State var categoryChoice = 0
    @State var sizeChoice = 0
    
    
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
                ScrollView {
                    // MARK: - 기본정보
                    VStack {
                        VStack {
                            TextField("브랜드명", text: $brandName)
                                .font(.title)
                                .multilineTextAlignment(.center)
                            Divider()
                            TextField("제품명", text: $productName)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                            Divider()
                            Picker("Category", selection: $categoryChoice) {
                                ForEach(0 ..< categorys.count) { index in
                                    Text(self.categorys[index])
                                        .tag(index)
                                }
                                
                            }.pickerStyle(SegmentedPickerStyle())
                            Divider()
                            Picker("Size", selection: $sizeChoice) {
                                ForEach(0 ..< sizes.count) { index in
                                    Text(self.sizes[index])
                                        .tag(index)
                                }
                                
                            }
                        }
                        
                        Divider()
                        
                        ScrollView(.vertical) {
                            VStack {
                                // MARK: - 제품 사진
                                ScrollView(.horizontal) {
                                    
                                    HStack {
                                        AddCard()
                                        //                                            .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous).stroke(Color.gray).frame(width: 400, height: 160))
                                        //                                            .padding(.leading, 150)
                                        //                                            .padding(.trailing, 100)
                                        
                                        BackgroundImage(image: Image("sacai"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 300)//400
                                        BackgroundImage(image: Image("acw"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 300)//400
                                        BackgroundImage(image: Image("testProfile"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 300)//400
                                        BackgroundImage(image: Image("nikelogo"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 300)//400
                                    }
                                }
                                Divider()
                                // MARK: - 제품 리뷰
                                //develop another card class that represents the
                                ScrollView(.horizontal) {
                                    HStack {
                                        AddCard()
                                        RatingForm_Edit(category: "Sizing", sizeRating: $sizeRating, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Edit(category: "Comfort", sizeRating: $comfortRating, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Edit(category: "Design", sizeRating: $designRating, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Edit(category: "Quality",sizeRating: $qualityRating, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Edit(category: "Mix and Match",sizeRating: $mixAndmatch, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Edit(category: "Headturning",sizeRating: $headTurning, testReview: $testReview).padding(.top, 20)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                }
            }
            
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//
//        .navigationBarTitle("Hidden Title")
//        .navigationBarHidden(true)
    }
    
}
