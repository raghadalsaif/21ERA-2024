//
//  SplashScreenView.swift
//  SplashScreen
//
//  Created by Federico on 20/01/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var imageOffset = CGSize.zero
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var rotate = false

    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            OnboardingView()
            
        } else {
            ZStack {
                Color("BackColor").opacity(0.1).ignoresSafeArea()
                
                Text("21ERA")
                    .font(.custom("basecoat-bold", size: 50))
                    .foregroundColor(Color("FontLargeTitle"))
                    .bold()
                    .padding(.bottom , 500)
                
                    VStack(spacing: -150){
                        Image("shapeYellow")
                        Image("shapeOrange")
                        Image("shapePink")
               
                    
                    }.padding(.top ,200)
                    
                    
                Image("Character")
                    .resizable()
                    .frame(width: 300, height: 280)
                    .offset(y: imageOffset.height)
                    .animation(Animation.easeInOut(duration: 2.5))
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
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
