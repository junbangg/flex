import SwiftUI

struct RootViewController: View {
    
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
//                                .navigationBarTitle("Home",displayMode: .inline)
                                
                        }
                        .edgesIgnoringSafeArea(.bottom)
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .navigationBarTitle("Hidden Title")
                    .navigationBarHidden(true)
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
//                        NeuromorphicMypage()
                        SegmentedTab()
                    }
                }
                
            }.background(Color(.white).edgesIgnoringSafeArea(.all))
            
            FloatingTabBar(selected: self.$selected)
            
        }
    }
}

struct RootViewController_Previews: PreviewProvider {
    static var previews: some View {
        RootViewController()
    }
}


