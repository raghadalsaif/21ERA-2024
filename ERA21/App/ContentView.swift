//
//  ContentView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 10/11/1444 AH.
//

import SwiftUI

struct ContentView: View {

    
    
    var body: some View {
        ZStack {
         
            
            
            
               
            TabView{
               
            
                CommunityView()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                         
                        Text("Community")
                    }
               
                ChallengeView()
                    .tabItem {
                        Image(systemName: "rectangle.fill.on.rectangle.fill")
                        Text("Challenges")
                    }
                
                View21ERA()
                    .tabItem {
                        Image(systemName: "person.crop.rectangle.fill")
                        Text("21ERA")
                    }
                
                
                
                 
            }.accentColor(Color("MainColor"))
                
                
               
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


