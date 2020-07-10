import SwiftUI


// TODO: - Plus button is awkward when always in the view, change so that when editing, a floatable button hovers above horizontal view
//TODO: - 댓글창 float  or  fixed  결정
//TODO: - Decide whether User info is included in top of page


struct ReviewDetails: View {
    
    @State private var selection : Int? = nil
    
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
    
    @State private var comment : String = ""
    
    @State private var flamePressed : Bool = false
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    func compute() -> String {
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
                    //                    NavigationLink(destination: ReviewCard_Edit(), tag : 1, selection: $selection){
                    //                        EmptyView()
                    //
                    //                        Button(action: {
                    //                            print("edit button pressed")
                    //                            self.selection = 1
                    //                        }) {
                    //                            Text("Edit")
                    //                                .font(.headline)
                    //                                .foregroundColor(Color.blue)
                    //                                .offset(x:180,y:-30)
                    //                        }
                    //
                    //
                    //                    }
                    HStack {
                        HStack {
                            //Profile
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(MyColors.ferrariRed)
                                    .frame(width:80, height: 3)
                                    .zIndex(1)
                                
                                CircleImage(image: Image("testProfile"))
                                    //                    .resizable()
                                    .frame(width:100, height:100)
                                    .padding(.top, 6)
                                    .padding(.bottom,4)
                                    .padding(.horizontal, 8)
                                    //                            .background(MyColors.offwhite)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    //                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                                    //                            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                                    .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                            }
                            .padding(.horizontal,20)
                            .padding(.top,10)
                            //                            VStack(alignment: .leading, spacing: 12) {
                            //                                Text("olafo0o")
                            //                                    .font(.title)
                            //                                    .foregroundColor(Color.black.opacity(0.8))
                            //                                Text("사용자 소개")
                            //                                    .foregroundColor(Color.black.opacity(0.7))
                            //                            }
                            //                            .padding(.leading,20)
                            Spacer(minLength: 0)
                        }
                        VStack {
                            Text("Nike x Sacai")
                                .font(.title)
                                .multilineTextAlignment(.center)
                            Text("LDV Waffle")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        .offset(x:-80)
                        
                    }
                    
                    //                    Divider()
                    // MARK: - 데이터
                    VStack {
                        HStack {
                            //Rating
                            Text(self.compute())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.yellow)
                                .padding(.horizontal)
                            
                            Spacer()
                            //Flame Button
                            VStack {
                                Button(action: {self.flamePressed.toggle()}) {
                                    Image(systemName: "flame")
                                        .foregroundColor(self.flamePressed==false ? MyColors.ferrariRed : .gray)
                                        .font(.system(size: 30, weight: .medium))
                                }
                                .padding(.horizontal)
                                //                                .buttonStyle(NeuromorphicRectButtonStyle())
                            }
                            .offset(x:-10, y:-5)
                            
                        }
                        .padding(.top,20)
                        HStack {
                            //size info
                            HStack {
                                Image(systemName: "s.circle")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 20, weight: .medium))
                                Text("265")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:50)
                                    .foregroundColor(Color.gray)
                                    .offset(x:-10)
                            }
                            .offset(x:-30)
                            Spacer()
                            
                            //                    .offset(x:40, y:-25)
                            //flame info
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
                            .offset(x:-20)
                            Spacer()
                            //                                .offset(x:20)
                            //                    .offset(x:40, y:-40)
                            
                            HStack {
                                Image(systemName: "eye")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 15, weight: .medium))
                                Text("3000")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                                    .foregroundColor(Color.gray)
                                    .offset(x:10)
                            }
                            .offset(x:15)
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "bubble.left.and.bubble.right")
                                    .foregroundColor(Color.gray)
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
                        .padding(.horizontal,50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                    }
                    //                    Divider()
                    //                    ScrollView(.vertical) {
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
                                
                                BackgroundImage(image: Image("nikelogo"))
                                    //                                            .edgesIgnoringSafeArea(.top)
                                    .frame(height: 300)//400
                            }
                        }
//                        Divider()
                        // MARK: - 제품 리뷰
                        //develop another card class that represents the
                        ScrollView(.horizontal) {
                            HStack {
                                RatingForm_Display(category: "Sizing", sizeRating: $sizeRating, testReview: $testReview)
                                    .padding(.top, 20)
//                                    .padding(.leading,10)
                                
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
                            .padding(.bottom,20)
                        }
                        .offset(y:-20)
                        
                    }
                    .padding(.top,10)
                    //                    }
                    
                    Spacer()
                    
                }
                    //MARK: -Set Offset for entire VStack
                    .offset(y:30)
                
            }
            // MARK: - 댓글창
            // TODO: - Add navigation to a new Comments page(Create as well)
            HStack {
                
                Image(systemName: "bubble.left.and.bubble.right")
                    .foregroundColor(Color.black)
                    .font(.system(size: 15, weight: .medium))
                    .padding(.leading,10)
                Text("22")
                    .font(.headline)
                    .fontWeight(.regular)
                    .fixedSize()
                    .frame(width:20)
                    .foregroundColor(Color.gray)
                
                Spacer()
                TextField("댓글을 입력하세요...", text: $comment)
                
                
                Button(action: {
                    print("send")
                }) {
                    Image(systemName: "paperplane")
                    .foregroundColor(Color.blue)
                    .font(.system(size:20, weight: .medium))
                    
                }
//                    .padding(.trailing,10)
                .buttonStyle(NeuromorphicButtonStyle())
                
                
                
            }
            //                FloatingNavigationTab()
        }
        
        //        }
        //        .navigationViewStyle(StackNavigationViewStyle())
        //        .navigationBarTitle("Hidden Title")
        //        .navigationBarHidden(true)
    }
    
}
