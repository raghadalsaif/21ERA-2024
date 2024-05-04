//
//  Friends.swift
//  21era
//
//  Created by Nsreen Alfaifi on 11/11/1444 AH.
//

import SwiftUI

struct Friends: View {

    
    let friendsData = ["Sana", "Shaden", "Razan", "Malak", "Raghad"]
    var body: some View {
        
        
        
        ScrollView {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 1 ) {

                        
                    ForEach(0..<friendsData.count - 2, id: \.self) { friend in
                            NavigationLink(destination: FriendDetailPage(friendName: friendsData[friend])) {
                              
                                Image("CharacterBackground2")
                                    .frame(width: 270 , height: 150 )
                                    .cornerRadius(12)
                                    .shadow(color: .gray, radius: 3 , x: 0, y: 0)
                                    .overlay(
                                        Image("Character")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 135 )
                                            .padding(.top )
                                            .overlay(
                                                Rectangle()
                                                    .frame(width: 270 , height: 38 )
                                                    .foregroundColor(Color.white).blur(radius: 0.9 ).opacity(0.98)
                                                    .padding(.top , 110)
                                                    .cornerRadius(12)
                                                    .overlay(
                                                        HStack(spacing: 155){
                                                            
                                                            Text(friendsData[friend])
                                                                .foregroundColor(.black)
                                                                .font(.custom("basecoat", size: 16))
                                                            Button {
                                                                
                                                            } label: {
                                                                Image(systemName: "hands.clap")
                                                                    .resizable()
                                                                    .frame(width: 33, height: 30)
                                                                    .foregroundColor(Color("MainColor"))
                                                            }
                                                            
                                                            
                                                        } .padding(.top , 110)
                                                        
                                                    )// Overlay 2
                                                
                                            )// Overlay 2
                                        
                                    )// Overlay 1
                            }
                        }

    
                            
                  .padding()
                        
                        
                        
                        
                        

                }
            }
        }
    

    
        }

}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}



//struct FriendscReqCard: View {
//
//    @State private var userData = UserData(username: "Nsreen", personalType: "s", phone: "0555555555", password: "12345678", Character: "Character")
//    var body: some View {
//
//
//        ZStack{
//
//            Button {
//                //
//
//            } label: {
//                Image("CharacterBackground2")
//                    .frame(width: 270 , height: 150 )
//                    .cornerRadius(12)
//                    .shadow(color: .gray, radius: 5 , x: 0, y: 0)
//                    .overlay(
//
//                        Image(userData.Character)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 135 )
//                            .padding(.top )
//                            .overlay(
//                                Rectangle()
//                                    .frame(width: 270 , height: 38 )
//                                    .foregroundColor(Color.white).blur(radius: 0.9 ).opacity(0.98)
//                                    .padding(.top , 110)
//                                    .cornerRadius(12)
//                                    .overlay(
//                                        HStack(spacing: 155){
//
//                                            Text(userData.username)
//                                                .foregroundColor(.black)
//                                                .font(.headline)
//                                            Button {
//
//                                            } label: {
//                                                Image(systemName: "hands.clap")
//                                                    .resizable()
//                                                    .frame(width: 33, height: 30)
//                                                    .foregroundColor(Color("MainColor"))
//                                            }
//
//
//                                        } .padding(.top , 115)
//
//                                    )// Overlay 2
//
//                            )// Overlay 2
//
//                    )// Overlay 1
//            }
//        }
//    }
//}



