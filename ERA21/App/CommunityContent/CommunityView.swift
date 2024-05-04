//
//  CommunityView.swift
//  21era
//
//  Created by Nsreen Alfaifi on 11/11/1444 AH.
//

import SwiftUI

struct CommunityView: View {
    
    
    
    var body: some View {

        NavigationView{
       
                
            
            ZStack{
        
                ScrollView{
                    VStack{
                        
                        Divider()
                        
                        VStack(spacing: 25){
                            
                            
                            //21st Challenge
                            VStack(alignment: .leading,spacing: 16){
                                
                                HStack(spacing: 210){
                                    Text("21st Challenge")
                                        .font(.custom("basecoat-bold", size: 20))
                                       
                                    
                                    Text("")
                                    
                                }
                                
                                VStack{
                                    Community21stCounter()
                                    Text("21 Era challenge is coming soon")
                                        .font(.custom("basecoat", size: 13))
                                        .foregroundColor(Color.gray)
                                    
                                }     .padding(.leading , 70)
                                
                            }    .padding(.top)
                            
                            
                            VStack(spacing: 25){
                                
                                //Friends
                                VStack(spacing: 1){
                                    HStack(spacing: 225){
                                        Text("Friends")
                                            .font(.custom("basecoat-bold", size: 20))
                                        
                                        
                                        NavigationLink(destination:  FriendsPage()) {
                                            HStack(spacing:2){
                                                Text("See All")
                                                    .font(.custom("basecoat-bold", size: 13))
                                                Image(systemName: "chevron.forward")
                                                
                                            }//end HStack
                                            .foregroundColor(Color("MainColor"))
                                            .font(.headline)
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                    }//end HStack
                                    
                                    Friends()
                                    
                                }
                                
                                
                                
                                //Challenge by price
                                VStack(spacing: 1){
                                    
                                    HStack(spacing: 180){
                                        Text("Challenge by price")
                                            .font(.custom("basecoat-bold", size: 20))
                                        
                                        Text("")
                                        
                                    }
                                    
                                    ChallengesByPrice()
                                    
                                    
                                    
                                }
                            }
                            
                        }
                        
                        //    .padding()
                        
                        
                    }// end VStack
                }
                
                
                
                .navigationTitle("Community")
            }
            
            
        }// end NavigationView
        
        
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
