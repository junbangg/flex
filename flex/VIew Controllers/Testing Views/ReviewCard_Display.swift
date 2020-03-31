import SwiftUI

// TODO: - Plus button is awkward when always in the view, change so that when editing, a floatable button hovers above horizontal view
//TODO: - 댓글창 float  or  fixed  결정
//TODO: - Decide whether User info is included in top of page


struct ReviewCard_Display: View {
    
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
                            //                            TextField("브랜드명", text: $brandName)
                            //                                .font(.title)
                            //                                .multilineTextAlignment(.center)
                            //                            TextField("제품명", text: $productName)
                            //                                .font(.headline)
                            //                                .multilineTextAlignment(.center)
                            Text("Nike x Sacai")
                                .font(.title)
                                .multilineTextAlignment(.center)
                            Text("LDV Waffle")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                            
                        }
                        Divider()
                        // MARK: - 데이터
                        VStack {
                            HStack {
                                Text(self.compute())
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.yellow)
                                
                                Spacer()
                                
                                //                                VStack {
                                //                                    Button(action: {self.testVotes += 1}) {
                                //                                        Text("Checked")
                                //                                    }.foregroundColor(Color.red)
                                //                                    Text("\(testVotes)").foregroundColor(Color.gray)
                                //                                }
                                VStack {
                                    Button(action: {print("bookmarked")}) {
                                        Image(systemName: "bookmark")
                                            .font(.system(size: 30, weight: .medium))
                                    }
                                }
                                .offset(x:-10, y:-5)
                                
                                
                            }
                            HStack {
                                HStack {
                                    Image(systemName: "s.circle")
                                        .foregroundColor(Color.blue)
                                        .font(.system(size: 20, weight: .medium))
                                    Text("265")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .fixedSize()
                                        .frame(width:50)
                                        .foregroundColor(Color.gray)
                                        .offset(x:-10)
                                }
                                Spacer()
                                //                                .offset(x:-10)
                                
                                //                    .offset(x:40, y:-25)
                                HStack {
                                    Image(systemName: "flame")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 20, weight: .medium))
                                    Text("533")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .fixedSize()
                                        .frame(width:20)
                                        .foregroundColor(Color.gray)
                                        .offset(x:10)
                                }
                                Spacer()
                                //                                .offset(x:20)
                                //                    .offset(x:40, y:-40)
                                
                                HStack {
                                    Image(systemName: "eye")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 15, weight: .medium))
                                    Text("3000")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .fixedSize()
                                        .frame(width:20)
                                        .foregroundColor(Color.gray)
                                        .offset(x:10)
                                }
                                .offset(x:20)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "bubble.left.and.bubble.right")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 15, weight: .medium))
                                    Text("2")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .fixedSize()
                                        .frame(width:20)
                                        .foregroundColor(Color.gray)
                                }
                                .offset(x:50)
                                Spacer()
                                //                                .offset(x:50, y:1)
                                
                            }
                        }
                        
                        
                        Divider()
                        
                        ScrollView(.vertical) {
                            VStack {
                                // MARK: - 제품 사진
                                ScrollView(.horizontal) {
                                    
                                    HStack {
                                        //                                        AddCard()
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
                                        
                                        RatingForm_Display(category: "Sizing", sizeRating: $sizeRating, testReview: $testReview).padding(.top, 20)
                                        .padding(.leading,10)
                                        
                                        Spacer()
                                        RatingForm_Display(category: "Comfort", sizeRating: $comfortRating, testReview: $testReview).padding(.top, 20)
                                        .padding(.leading,10)
                                        RatingForm_Display(category: "Design", sizeRating: $designRating, testReview: $testReview).padding(.top, 20)
                                        .padding(.leading,10)
                                        RatingForm_Display(category: "Quality",sizeRating: $qualityRating, testReview: $testReview).padding(.top, 20)
                                        .padding(.leading,10)
                                        RatingForm_Display(category: "Mix and Match",sizeRating: $mixAndmatch, testReview: $testReview).padding(.top, 20)
                                        RatingForm_Display(category: "Headturning",sizeRating: $headTurning, testReview: $testReview).padding(.top, 20)
                                        .padding(.leading,10)
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
