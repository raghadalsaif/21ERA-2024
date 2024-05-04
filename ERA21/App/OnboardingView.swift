//
//  OnboardingView.swift
//  21ERA onboarding
//
//  Created by Shaden on 11/11/1444 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPageIndex = 0
    
    @AppStorage("hasShownOnboarding") var hasShownOnboarding: Bool = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("Splash")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            VisualEffectView(effect: UIBlurEffect (style: .systemThinMaterialLight))
                .edgesIgnoringSafeArea(.all)
            
            
            Image("Loading background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            if hasShownOnboarding {
                VStack(spacing: 5){
                 
                    
                    
                    TabView(selection: $currentPageIndex) {
                        OnboardingPageView(imageName: "charactersport", title: "Welcome  to 21ERA,           ", description: "Lets make the impossible possible together")
                            .tag(0)
                        
                        OnboardingPageView(imageName: "", title: "At 21ERA,                                ", description: "We believe that everyone has to potential to achieve their dreams and lead a fulfilling life")
                            .tag(1)
                        
                        OnboardingPageView(imageName: "", title: "At 21ERA, We are here to support you!" , description: "Get ready for an incredible journey, connections and great achievements")
                            .tag(2)
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
                  
                    Button(action: {
                        if currentPageIndex < 2 {
                            currentPageIndex += 1
                        } else {
                            hasShownOnboarding = false
                        }
                    }) {
                        Text(currentPageIndex < 2 ? "Continue" : "Get Started")
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: 298, height: 60)
                            .background(Color("SceondColor 1"))
                            .foregroundColor(.white)
                            .cornerRadius(17)
                        .padding(.horizontal)            }
                    .padding(.bottom, 50)
                 }
             } else {
               
               ContentView()

            
        }
            
        }
        }
    }


struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            
            if imageName.isEmpty{
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 70)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    Spacer(minLength: 15)
               
                
                Text(description)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0, blue: 0, alpha: 1)))
                    .frame(width: 318, height: 177)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer(minLength: 310)
            }else{
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 70)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer(minLength: 130)
                
                
                Image(imageName)
                    .resizable()
                    .frame(width: 243, height: 177)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 50)
                Spacer(minLength: 62)
                
                Text(description)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0, blue: 0, alpha: 1)))
                    .frame(width: 318, height: 177)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
           
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


struct BackgroundDsign_Previews: PreviewProvider {
static var previews: some View {
    OnboardingView()
}
    
}
//
struct VisualEffectView: UIViewRepresentable {
var effect: UIVisualEffect?
func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

