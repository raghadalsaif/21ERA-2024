//
//  View21ERA.swift
//  ERA21
//
//  Created by Nsreen Alfaifi on 19/11/1444 AH.
//

import SwiftUI

struct View21ERA: View {
  
    @State private var selectedOption: Int = 0

    var body: some View {
        NavigationView {
            
            let options = ["Profile" , "LeaderBoard"]
            
            VStack{
                
                HStack{
                    Text("21ERA")
                
                        .font(.custom("basecoat-bold", size: 34))
                        .font(.largeTitle)
                        .bold()

                    Spacer()
                    
                    Text("")
                    
//                    NavigationLink(destination: Login()) {
//                        Image(systemName: "plus.circle")
//                            .font(.title)
//                            .foregroundColor(Color("MainColor"))
//
//                    }
                     
                            
                        
                        
                    
                }
                .padding()
            
                
                Divider()
                
                VStack {
                    
                    VStack{
                        VStack(alignment: .leading){
                            Text("Hi, Nsreen")
                                .font(.title2)
                                .font(.custom("basecoat", size: 20))
                                .bold()
                            
                            Text("Be the change you wish to see in the world")
                                .font(.custom("basecoat", size: 15))
                                .foregroundColor(Color("MainColor"))
                            
                        }
                        
                        
                        
                        
                        Picker21ERA()
                     
                    }
                    
                    Spacer()
                    
                    
                    
                    
                }
                
            }
            
//            .navigationTitle("21ERA")
        }
        
    }
}

struct View21ERA_Previews: PreviewProvider {
    static var previews: some View {
        View21ERA()
    }
}

