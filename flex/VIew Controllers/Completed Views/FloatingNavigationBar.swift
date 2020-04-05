import SwiftUI

struct FloatingNavigationBar: View {
    
    @State var selected = 0
    let col1 = UIColor(red: 235, green: 235, blue: 235, alpha: 1)
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            VStack{
                // MARK: - Home
                if self.selected == 0 {
                    
                    NavigationView{
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            VStack(spacing: 15){
                                
                                ForEach(1...8,id: \.self){i in
                                    
                                    Image("p\(i)").resizable().frame(height: 250).cornerRadius(15)
                                }
                                
                            }.padding()
                                .navigationBarTitle("Home",displayMode: .inline)
                            
                        }
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
                    // MARK: - Search
                else if self.selected == 1{
                    
                    GeometryReader{_ in
                        
                        Text("Search")
                    }
                    
                }
                    // MARK: - Add New Item
                else if self.selected == 2{
                    
                    GeometryReader{_ in
                        
                        ReviewCard_Edit()
                    }
                    
                }
                    // MARK: - Mypage
                else{
                    
                    GeometryReader{_ in
                        
                        NavigationView {
                            VStack {
                                //                ScrollView {
                                VStack {
                                    CircleImage(image: Image("testProfile") )
                                        .frame(width: 200, height:200)
                                        .aspectRatio(contentMode: .fit)
                                    Text("Asdf")
                                        .font(.title)
                                        .padding()
                                    HStack {
                                        VStack {
                                            Text("Rank")
                                                .font(.headline)
                                            //                            .foregroundColor(Color.red)
                                            Text("Gold"
                                            ).foregroundColor(Color.yellow)
                                        }
                                        .padding(.leading)
                                        Spacer()
                                        VStack {
                                            Text("Flames")
                                                .font(.headline)
                                            //                            .foregroundColor(Color.red)
                                            Text("365").foregroundColor(Color.gray)
                                        }
                                        .padding(.leading, 30.0)
                                        Spacer()
                                        VStack {
                                            Text("Followers")
                                                .font(.headline)
                                            //                            .foregroundColor(Color.red)
                                            Text("1234")
                                                .foregroundColor(Color.gray)
                                        }
                                        .padding(.trailing)
                                    }
                                    Divider()
                                    
                                    //                TimelineView()
                                    // MARK: - List of Review Items
                                    UsersItems()
                                }
                            }
                        }
                        .navigationViewStyle(StackNavigationViewStyle())
                        .navigationBarTitle("Hidden Title")
                        .navigationBarHidden(true)
                    }
                }
                
            }.background(Color(.white).edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: self.$selected)
        }
    }
}

struct FloatingNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingNavigationBar()
    }
}

struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    
    var body : some View{
        
        HStack{
            
            Spacer(minLength: 0)
            // MARK: - Floating Navigation Tab
            HStack{
                
                if !self.expand{
                    
                    Button(action: {
                        
                        self.expand.toggle()
                        
                    }) {
                        Image(systemName: "arrow.left").foregroundColor(.black).padding()
                    }
                }
                else{
                    
                    Button(action: {
                        
                        self.selected = 0
                        
                    }) {
                        Image(systemName: "house")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 0 ? .black : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 1
                        
                    }) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 1 ? .black : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 2
                        
                    }) {
                        
                        Image(systemName: "plus.app")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 2 ? .black : .gray).padding(.horizontal)
                    }
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {
                        
                        self.selected = 3
                        
                    }) {
                        
                        Image(systemName: "person.circle")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(self.selected == 3 ? .black : .gray).padding(.horizontal)
                    }
                }
                
                
            }.padding(.vertical,self.expand ? 20 : 8)
                .padding(.horizontal,self.expand ? 35 : 8)
                //                .background(Color.white)
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .clipShape(Capsule())
                .padding(22)
                .gesture(DragGesture()
                    .onEnded{_ in
                        self.expand.toggle()
                })
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
            //                .onLongPressGesture {
            //
            //                    self.expand.toggle()
            //            }
            //            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
        
        
    }
}
