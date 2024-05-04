//
//  ChallengeView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct ChallengeView: View {
    
    let massege = "Explore thrilling challenges or start your own for an exhilarating experience of growth and accomplishment"
    var body: some View {
        NavigationView {
            
            VStack{
                HStack{
                    Text("Challenge")
                        .font(.largeTitle)
                        .bold()

                    Spacer()
                    
                    NavigationLink(destination: addChallenge()) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(Color("MainColor"))
                        
                    }
                     
                    
                            
                        
                        
                    
                }
                .padding()
                
                
                Divider()
                Spacer()
                VStack(alignment: .center ,spacing: 12){
                    Text("Challenge is Empty")
                        .font(.custom("basecoat-bold", size: 20))
                        .font(.title2)
                        
                    Text(massege)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .font(.custom("basecoat", size: 15))

                    
                }.padding().foregroundColor(.gray)
                Spacer()
                Spacer()

                
            }
        }
        
        .navigationBarBackButtonHidden(true)
            
        
        
    }

}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
