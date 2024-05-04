

import SwiftUI

struct LoadingScreenChallenge: View {
//    @EnvironmentObject var viewModel : ViewModel

   var body: some View {

     

       loadingTest()
    }
}

struct loadingTest: View {
    
    @State private var imageOffset = CGSize.zero
    @State var isLoding : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var rotate = false
    
    var body: some View {
        ZStack {
            Color("BackColor").opacity(0.1).ignoresSafeArea()
            
            VStack{
                Text("Small Acts, Big Impact")
                    .font(.custom("basecoat-bold", size: 28))
                    .foregroundColor(Color("FontLargeTitle"))
                    .bold()
                  
                HStack(spacing: 8){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint:.gray))
                    Text("We are preparing your challenge right now ")
                        .foregroundColor(Color.gray)
                        .font(.custom("basecoat", size: 14))
                }
            }.padding(.bottom , 500)
            
            
            
                VStack(spacing: -150){
                    Image("shapeYellow")
                    Image("shapeOrange")
                    Image("shapePink")
           
                
                }.padding(.top ,200)
                
                
            Image("Character")
                .resizable()
                .frame(width: 300, height: 280)
                .offset(y: imageOffset.height)
                .animation(Animation.easeInOut(duration:   5))
                .onAppear {
                    withAnimation {
                        imageOffset = CGSize(width: 1, height: -390)
                    }
                }.padding(.top,800)
            
            
           
            VStack(spacing: -150){
                Image("Shapegraen")
                // .frame(width: 432, height: 236)
                Image("ShapeBlue")
                //  .frame(width: 432, height: 240)
            }.padding(.top ,620)
            
            
        } .navigationBarBackButtonHidden(true)
    }
}



struct LoadingScreenChallenge_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenChallenge()
    }
}
