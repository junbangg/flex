import SwiftUI

struct Profile_Edit : View {
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    @State var intro : String = "사용자 소개"
    @State var newIntro : String = ""
    
    @State var isShowingImagePicker = false
    @State var profileImage = UIImage()
    @State var imageSelected = false
    
    @State var isNavBarHidden : Bool = false
    var body: some View{
        //MARK:- Main View
        NavigationView {
            VStack(spacing: 0){
                VStack {
                    //MARK: - Top
                    HStack(spacing: 15) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "text.justify")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                        }
                        .offset(y:1)
                        //MARK: -Username
                        Text("olafo0o")
                            .font(.title)//headline
                            .fixedSize()
                            .frame(width:50)
                            .foregroundColor(Color.black.opacity(0.8))
                            .padding(.leading)
                        Spacer(minLength: 0)
                        //Follow Button
                        Button (action: {
                            print("edit")
                        }) {
                            Text("저장")
                                .foregroundColor(Color.white)
                                .fixedSize()
                                .frame(width:50)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .background(MyColors.ferrariRed)
                                .cornerRadius(10)
                        }
                    }
                        //                .offset(y:-20)
                        .padding()
                    VStack {
                        //MARK: -Profile
                        HStack {
                            //MARK: -Profile Picture
                            ZStack {
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
                                Button(action: {
                                    self.isShowingImagePicker.toggle()
                                }) {
                                    Image(systemName: "plus.app")
                                        .font(.system(size:30,weight:.light))
                                        .foregroundColor(Color.blue)
                                }
                                .sheet(isPresented: self.$isShowingImagePicker, content: {
                                    ImagePicker(isPresented: self.$isShowingImagePicker, selectedImage: self.$profileImage, isSelected: self.$imageSelected)
                                })
                            }
                            //MARK: -Intro
                            TextField(intro, text: self.$newIntro)
                                .foregroundColor(Color.black.opacity(0.7))
                                .offset(x: 5, y:-45)//y -50
                        }
                        .padding(.horizontal,20)
                        //MARK: -Data
                        HStack {
                            //팔로워
                            HStack {
                                Text("팔로워")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(MyColors.ferrariRed)
                                Text("200")
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                            }
                            .offset(y:1)
                            //flames
                            HStack {
                                Image(systemName: "flame")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(MyColors.ferrariRed)
                                    .offset(x:10, y:-2)
                                
                                
                                Text("200")
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .fixedSize()
                                    .frame(width:20)
                                    .padding(.leading, 10)
                                
                            }
                        }
                            .offset(x:100)//45
                    }
                    //                .offset(y:-70)
                }
                .padding(.bottom, 30)
                //MARK: -Profile Contents
                ProfileUI(index: self.$index, offset: self.$offset)
                    .padding(.bottom,25)
                    .offset(y:-20)
                
                GeometryReader{g in
                    
                    HStack(spacing: 0){
                        Left(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width)
                        Middle(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width)
                        Right(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width)
                    }
                    .offset(x: self.offset,y:80)
                    .highPriorityGesture(DragGesture()
                    .onEnded({ (value) in
                        
                        if value.translation.width > 50{// minimum drag...
                            //                        print("right")
                            self.changeView(left: false)
                        }
                        if -value.translation.width > 50{
                            //                        print("left")
                            self.changeView(left: true)
                        }
                    }))
                    
                }
            }
            .animation(.default)
            .navigationViewStyle(StackNavigationViewStyle())
                //        .navigationBarBackButtonHidden(true)
                .navigationBarTitle("Profile", displayMode: .inline)
                .navigationBarHidden(self.isNavBarHidden)
                .onAppear {
                    self.isNavBarHidden = true
            }
        }
    }
    
    func changeView(left : Bool){
        
        if left{
            if self.index != 3{
                self.index += 1
            }
        }
        else{
            if self.index != 1{
                self.index -= 1
            }
        }
        if self.index == 1{
            self.offset = self.width
        }
        else if self.index == 2{
            self.offset = 0
        }
        else{
            self.offset = -self.width
        }
        // change the width based on the size of the tabs...
    }
}
//MARK: - App toggle bar
struct ProfileUI : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    @State var selected : Int = 0
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
            //            Group {
            HStack(spacing: 40) {//25
                Spacer()
                Button(action: {
                    self.index = 1
                    self.offset = self.width
                }) {
                    Text("Outfits")
                        .foregroundColor(self.index==1 ? .white : .gray)
                        .fixedSize()
                        .frame(width:35)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index==1 ? MyColors.ferrariRed : Color.clear)
                        .cornerRadius(10)
                }
                Button(action: {
                    self.index = 2
                    self.offset = 0
                }) {
                    Text("Reviews")
                        .foregroundColor(self.index==2 ? .white : .gray)
                        .fixedSize()
                        .frame(width:35)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index==2 ? MyColors.ferrariRed : Color.clear)
                        .cornerRadius(10)
                }
                Button(action: {
                    self.index = 3
                    self.offset = -self.width
                }) {
                    //                        Text("Bookmarks")
                    Image(systemName: "bookmark")
                        .foregroundColor(self.index==3 ? .white : .gray)
                        .fixedSize()
                        .frame(width:10)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index==3 ? MyColors.ferrariRed : Color.clear)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .padding(.horizontal)
                //            .offset(y:-30)
                //            .padding(.top,25)
                //            }
                //            .padding(.top,30)
//                .offset(y:-60)//-100
        
    }
}

struct Left : View {
    @Binding var isNavBarHidden : Bool
    var body: some View{
        GeometryReader{_ in
            VStack{
                //                ItemGrid()
                UserOutfits(isNavBarHidden: self.$isNavBarHidden)
            }
        }
        .background(Color.white)
        .offset(y:-100)
    }
}

struct Middle : View {
    @Binding var isNavBarHidden : Bool
    var body: some View{
        GeometryReader{_ in
            VStack{
                //                UsersItems()
                UserReviews(isNavBarHidden: self.$isNavBarHidden)
            }
        }
        .background(Color.white)
        .offset(y:-100)
    }
}

struct Right : View {
    @Binding var isNavBarHidden : Bool
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                UserOutfits(isNavBarHidden: self.$isNavBarHidden)
            }
        }
        .background(Color.white)
        .offset(y:-100)
    }
}
struct Profile_Edit_Preview: PreviewProvider {
    static var previews: some View {
        Profile_Edit()
    }
}
