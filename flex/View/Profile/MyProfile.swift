import SwiftUI

struct MyProfile : View {
    @ObservedObject var viewModel : ProfileViewModel //ProfileDataViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    @EnvironmentObject var obj : observed
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    @State var newIntro : String = ""
    @State var selected : Int = 0
    @State var followedPressed : Bool = false
    @State var isShowingImagePicker = false
    @State var profileImage = UIImage()
    @State var imageSelected = false
    //Used for hiding the navigation bar
    @State var isNavBarHidden : Bool = false
    //Flag for Follow button or Edit button
    @State var followFlag : Bool = true
    var body: some View{
        //MARK:- Main View
        NavigationView {
            VStack(spacing: 30){
                //MARK: - User Profile
                VStack {
                    //MARK: - Top Bar
                    HStack(spacing: 15) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "text.justify")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                        }
                        .offset(y:1)
                        //MARK: -Username
                        
                        Text((self.viewModel.dataSource?.username ?? "username") as String)//viewModel.username
                            .font(.title)//headline
                            .fixedSize()
                            .frame(width:50)
                            .foregroundColor(Color.black.opacity(0.8))
                            .padding(.leading)
                        Spacer(minLength: 0)
                        //Follow Button
                        //TODO: - Change this part to save button
                        Button(action: {
                            self.viewModel.update(profileImage: self.profileImage, intro: self.newIntro, profileImageChanged: self.imageSelected)
                        }){
                            Text("Save")
                                .foregroundColor(Color.white)
                                .fixedSize()
                                .frame(width:20)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(MyColors.ferrariRed)
                                .cornerRadius(10)
                        }
                        .padding(.top,5)
                        .padding(15
                            //                            Button (action: {
                            //                                print("edit")
                            //                            }) {
                            //
                            //                            }
                        )
                        
                        
                    }
                    .offset(y:-20)
                    .padding()
                    VStack {
                        HStack {
                            //MARK: -Profile Block
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
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                                    .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                            }
                                //                            .padding(.leading,20)
                                .offset(x:15)
                            //                            Spacer()
                            
                            //MARK: -Data Block
                            HStack {
                                VStack {
                                    //Posts
                                    HStack {
                                        Text("포스트")
                                            .font(.headline)
                                            .fontWeight(.medium)
                                            .foregroundColor(MyColors.ferrariRed)
                                        //                                        .offset(y:)
                                        Text("18")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .fixedSize()
                                            .frame(width:20)
                                    }
                                        .padding(.bottom,20)//5
                                        .offset(y:-1)
                                    //팔로워
                                    HStack {
                                        Text("팔로워")
                                            .font(.headline)
                                            .fontWeight(.medium)
                                            .foregroundColor(MyColors.ferrariRed)
                                            .offset(y:-1)
                                        Text("568")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .fixedSize()
                                            .frame(width:20)
                                    }
                                    .offset(y:3)
                                    
                                }
                                VStack {
                                    //views
                                    HStack {
                                        Image(systemName: "eye")
                                            .font(.system(size: 20, weight: .light))
                                            .foregroundColor(MyColors.ferrariRed)
                                        //                                        .offset(x:8)
                                        
                                        
                                        Text("23412")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .fixedSize()
                                            .frame(width:20)
                                            .padding(.leading, 10)
                                        
                                    }
                                    .padding(.bottom,15)
                                    .offset(y:1)
                                    //flames
                                    HStack {
                                        Image(systemName: "flame")
                                            .font(.system(size: 20, weight: .light))
                                            .foregroundColor(MyColors.ferrariRed)
                                            .offset(y:-2)
                                        
                                        
                                        Text("1865")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .fixedSize()
                                            .frame(width:20)
                                            .padding(.leading, 10)
                                        
                                    }
                                    .offset(y:1)
                                }
                                .padding(.horizontal, 15)
                            }
                            .padding(.top, 24)
                            .padding(.bottom,24)
                            .padding(.horizontal, 10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                            .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                                .offset(x:70)//100
                            
                        }
                        .offset(x:-50)
                        //                        .padding(.horizontal,20)
                        
                        //MARK: -User Info
                        //******************Version for multiline textview
                        //
                        
                        //                        VStack {
                        //                            //Text with regular intro.. but when tapped changes to editable
                        //                            TextView(text: self.viewModel.dataSource?.intro ?? "소개작성")
                        //                                .frame(height:self.obj.size)
                        //                                .padding()
                        //                                .background(Color.white)
                        //                                .cornerRadius(10)
                        //
                        //                        }
                        //                        .padding(.top, 6)
                        //                        .padding(.bottom,4)
                        //                        .padding(.horizontal, 8)
                        //                        .background(Color.white)
                        //                        .cornerRadius(10)
                        //                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y:10)
                        //                        .shadow(color:Color.white.opacity(0.7), radius:10, x:-5, y:-5)
                        //                        .padding()
                        
                        
                        TextField(self.viewModel.dataSource?.intro ?? "소개작성", text: self.$newIntro)
                            .foregroundColor(Color.black.opacity(0.7))
                            .offset(x: 30,y:10)//y -50
                        
                    }
                        .offset(y:-50)//-70
                }
                //                .padding(.bottom, 30)
                AppBar(index: self.$index, offset: self.$offset)
                    .padding(.bottom,10)
                //                                    .offset(y:-20)
                //MARK: - User Posts
                GeometryReader{g in
                    
                    HStack(spacing: 0){
                        First(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width, height: g.frame(in: .global).height)
                        Scnd(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width, height: g.frame(in: .global).height)
                        Third(isNavBarHidden: self.$isNavBarHidden)
                            .frame(width: g.frame(in : .global).width)
                    }
                        .offset(x: self.offset)//y:-90
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
            .onAppear(perform: self.viewModel.refresh)
            
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
//struct MyAppBar : View {
//
//    @Binding var index : Int
//    @Binding var offset : CGFloat
//
//    var width = UIScreen.main.bounds.width
//
//    var body: some View{
//
//        HStack(spacing: 40) {//25
//            Spacer()
//            Button(action: {
//                self.index = 1
//                self.offset = self.width
//            }) {
//                Text("Outfits")
//                    .foregroundColor(self.index==1 ? .white : .gray)
//                    .fixedSize()
//                    .frame(width:35)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(self.index==1 ? MyColors.ferrariRed : Color.clear)
//                    .cornerRadius(10)
//            }
//            Button(action: {
//                self.index = 2
//                self.offset = 0
//            }) {
//                Text("Reviews")
//                    .foregroundColor(self.index==2 ? .white : .gray)
//                    .fixedSize()
//                    .frame(width:50)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(self.index==2 ? MyColors.ferrariRed : Color.clear)
//                    .cornerRadius(10)
//            }
//            Button(action: {
//                self.index = 3
//                self.offset = -self.width
//            }) {
//                //                        Text("Bookmarks")
//                Image(systemName: "bookmark")
//                    .foregroundColor(self.index==3 ? .white : .gray)
//                    .fixedSize()
//                    .frame(width:10)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(self.index==3 ? MyColors.ferrariRed : Color.clear)
//                    .cornerRadius(10)
//            }
//            Spacer()
//        }
//        .padding(.horizontal,10)
//        .padding(.vertical,5)
//        .background(Color.white)
//        .cornerRadius(8)
//        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//        .padding(.horizontal)
//        //            .offset(y:-30)
//        //            .padding(.top,25)
//
//        //            .padding(.top,30)
//    }
//}
//
//struct MyFirst : View {
//    @Binding var isNavBarHidden : Bool
//    var body: some View{
//        GeometryReader{_ in
//            VStack{
//                //                ItemGrid()
//                UserOutfits(isNavBarHidden: self.$isNavBarHidden)
//            }
//        }
//        .background(Color.white)
//        //        .offset(y:-90)
//    }
//}
//
//struct MySecond : View {
//    @Binding var isNavBarHidden : Bool
//    var body: some View{
//        GeometryReader{_ in
//            //            ScrollView {
//            VStack{
//                //                UsersItems()
//                UserReviews(isNavBarHidden: self.$isNavBarHidden)
//            }
//            //                .edgesIgnoringSafeArea(.all)
//            //            }
//
//        }
//
//        .background(Color.white)
//        //        .offset(y:-90)
//    }
//}
//
//struct MyThird : View {
//    @Binding var isNavBarHidden : Bool
//    var body: some View{
//
//        GeometryReader{_ in
//
//            VStack{
//                UserOutfits(isNavBarHidden: self.$isNavBarHidden)
//            }
//        }
//        .background(Color.white)
//        //        .offset(y:-90)
//    }
//}

//struct Profile_Preview: PreviewProvider {
//    static var previews: some View {
//        Profile()
//    }
//}
