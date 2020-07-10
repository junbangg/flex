import SwiftUI

struct SegmentedTab : View {
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(spacing: 0){
            
            AppBar(index: self.$index, offset: self.$offset)
                .padding(.bottom,25)
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    First()
                        .frame(width: g.frame(in : .global).width)
                    Scnd()
                        .frame(width: g.frame(in : .global).width)
                    Third()
                        .frame(width: g.frame(in : .global).width)
                }
                .offset(x: self.offset)
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

struct AppBar : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            //            UserInfo()
            //Top
            HStack(spacing: 15) {
                Button(action: {
                    
                }) {
                    Image(systemName: "text.justify")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                }
                .offset(y:1)
                Text("Profile")
                    .font(.title)
                Spacer(minLength: 0)
                
                Button(action: {

                }) {
                    Text("Follow")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(MyColors.ferrariRed)
                        .cornerRadius(10)
                }
                
//                Button(action: {
//                    
//                }){
//                    Image(systemName: "text.justify")
//                        //                            .foregroundColor(MyColors.offwhite)
//                        .foregroundColor(Color.black)
//                        .padding(.vertical, 10)
//                        //                            .padding(.horizontal, 25)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                }
                //                    .buttonStyle(NeuromorhpicButtonStyle())
            }
            .padding()
            //Profile
            HStack {
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
                VStack(alignment: .leading, spacing: 12) {
                    Text("olafo0o")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.8))
                    Text("사용자 소개")
                        .foregroundColor(Color.black.opacity(0.7))
                }
                .padding(.leading,20)
                Spacer(minLength: 0)
            }
            .padding(.horizontal,20)
            .padding(.top,10)
            //App Bar
            HStack(spacing: 25) {
                Spacer()
                Button(action: {
                    self.index = 1
                    self.offset = self.width
                }) {
                    Text("Outfits")
                        .foregroundColor(self.index==1 ? .white : .gray)
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
                    Image(systemName: "flame.fill")
                        .foregroundColor(self.index==3 ? .white : .gray)
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
            .padding(.top,25)
            //            HStack{
            //                Button(action: {
            //                    self.index = 1
            //                    self.offset = self.width
            //                }) {
            //                    VStack(spacing: 8){
            //                        HStack(spacing: 12){
            //                            Image(systemName: "circle.grid.3x3")
            //                                .foregroundColor(self.index == 1 ? .white : Color.gray.opacity(0.7))
            //                        }
            //                        Capsule()
            //                            .fill(self.index == 1 ? Color.white : Color.clear)
            //                            .frame(height: 4)
            //                    }
            //                }
            //                Button(action: {
            //                    self.index = 2
            //                    self.offset = 0
            //                }) {
            //                    VStack(spacing: 8){
            //                        HStack(spacing: 12){
            //                            Image(systemName: "list.dash")
            //                                .foregroundColor(self.index == 2 ? .white : Color.gray.opacity(0.7))
            //                        }
            //                        Capsule()
            //                            .fill(self.index == 2 ? Color.white : Color.clear)
            //                            .frame(height: 4)
            //                    }
            //                }
            //                Button(action: {
            //                    self.index = 3
            //                    self.offset = -self.width
            //                }) {
            //                    VStack(spacing: 8){
            //                        HStack(spacing: 12){
            //                            Image(systemName: "list.dash")
            //                                .foregroundColor(self.index == 3 ? .white : Color.gray.opacity(0.7))
            //                        }
            //                        Capsule()
            //                            .fill(self.index == 3 ? Color.white : Color.clear)
            //                            .frame(height: 4)
            //                    }
            //                }
            //            }
        })
        //            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
        //            .padding(.horizontal)
        //            .padding(.bottom, 10)
        //            .background(Color.white)
    }
}

struct First : View {
    var body: some View{
        GeometryReader{_ in
            VStack{
                //                ItemGrid()
                UserOutfits()
            }
        }
        .background(Color.white)
    }
}

struct Scnd : View {
    var body: some View{
        GeometryReader{_ in
            VStack{
                //                UsersItems()
                UserReviews()
            }
        }
        .background(Color.white)
    }
}

struct Third : View {
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                UserOutfits()
            }
        }
        .background(Color.white)
    }
}

struct SegmentedTab_Preview: PreviewProvider {
    static var previews: some View {
        SegmentedTab()
    }
}
