import SwiftUI

// TODO: Plus button is awkward when always in the view, change so that when editing, a floatable button hovers above horizontal view

//TODO: 댓글창 float  or  fixed  결정

struct NewReviewCard: View {
    
    
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
                ScrollView {
                    // MARK: - 기본정보
                    VStack {
                        VStack {
                            TextField("브랜드명", text: $brandName)
                                .font(.title)
                                .multilineTextAlignment(.center)
                            TextField("제품명", text: $productName)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        Divider()
                        // MARK: - 데이터
                        HStack {
                            Text(self.compute())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.yellow)
                            
                            Spacer()
                            
                            VStack {
                                Button(action: {self.testVotes += 1}) {
                                    Text("Checked")
                                }.foregroundColor(Color.red)
                                Text("\(testVotes)").foregroundColor(Color.gray)
                            }
                        }
                        Divider()
                        
                        ScrollView(.vertical) {
                            VStack {
                                // MARK: - 제품 사진
                                ScrollView(.horizontal) {
                                    
                                    HStack {
                                        AddCard()
                                        BackgroundImage(image: Image("nikelogo"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("sacai"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("4"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("testProfile"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                    }
                                }
                                // MARK: - 제품 리뷰
                                ScrollView(.horizontal) {
                                    HStack {
                                        BackgroundImage(image: Image("nikelogo"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("sacai"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("4"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                        BackgroundImage(image: Image("testProfile"))
                                            //                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 200)//400
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
            
        .navigationBarTitle("Hidden Title")
        .navigationBarHidden(true)
    }
    
}
