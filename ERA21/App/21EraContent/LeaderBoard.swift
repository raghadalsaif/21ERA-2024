//
//  LeaderBoard.swift
//  21era
//
//  Created by Nsreen Alfaifi on 15/11/1444 AH.
//

import SwiftUI

struct LeaderBoard: View {
    var body: some View {
        
        
        
        VStack{
            
            VStack(spacing: -20){
                
                VStack(spacing: -20){
                    
                    Image("Character")
                        .resizable()
                        .frame(width: 80 , height: 75)
                    
                    HStack(spacing: 135){
                        Image("Character")
                            .resizable()
                            .frame(width: 80 , height: 75)
                        
                    
                        
                        Image("Character")
                            .resizable()
                            .frame(width: 80 , height: 75)
                        
                        
                        
                    } .padding()
                    
                }
                
                
                
                Rectangle()
                    .fill(Color("LeaderBoardColor1"))
                    .frame(width: 320 , height: 115)
                    .cornerRadius(20)
                    .overlay {
                        Rectangle()
                            .fill(Color("LeaderBoardColor2"))
                            .frame(width: 120 , height: 130)
                            .padding(.bottom , 15)
                        Rectangle()
                            .fill(Color("LeaderBoardColor2"))
                            .frame(width: 120 , height: 180)
                            .cornerRadius(50)
                            .padding(.bottom , 70)
                        
                        
                        
                        HStack{
                            
                            VStack{
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("LeaderBoardColor3"), Color("LeaderBoardColor4")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("2")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Nsreen")
                                    .font(.custom("basecoat", size: 18))
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("12")
                                    .foregroundColor(Color("LeaderBoardColor4"))
                                    .font(.title2)
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 20){
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("MainColor"), Color("LeaderBoardColor3")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("1")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Shaden")
                                    .font(.custom("basecoat", size: 18))
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("15")
                                    .foregroundColor(Color("MainColor"))
                                    .bold()
                                    .font(.title)
                                    .padding(.bottom , 80)
                            }
                            
                            
                            Spacer()
                            
                            
                            VStack{
                                RhombusShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("sceondColor"), Color("LeaderBoardColor3")]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("3")
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                
                                Text("Razan")
                                    .font(.custom("basecoat", size: 18))
                                    .foregroundColor(.white)
                                    .bold()
                                
                                Text("10")
                                    .foregroundColor(Color("sceondColor"))
                                    .font(.title2)
                                    .bold()
                            }
                            
                        }.padding(.all , 15)
                            .padding(.trailing ,8)
                            .padding(.leading , 1)
                        
                        
                        
                        
                    }
                
            }
            
            qq()
 
            
        
        }
   
            
         
            

        
    }
}

struct LeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoard()
    }
}




struct RhombusShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        path.move(to: startPoint)
        
        let topRightPoint = CGPoint(x: rect.maxX, y: rect.midY)
        path.addLine(to: topRightPoint)
        
        let bottomPoint = CGPoint(x: rect.midX, y: rect.maxY)
        path.addLine(to: bottomPoint)
        
        let bottomLeftPoint = CGPoint(x: rect.minX, y: rect.midY)
        path.addLine(to: bottomLeftPoint)
        
        path.closeSubpath()
        
        
        return path
    }
}

struct ss: View {
    var body: some View {
        RhombusShape()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .top, endPoint: .bottom))
            .frame(width: 50, height: 50)
           
        
    }
}







struct User: Identifiable {
    var id = UUID()
    var imageName: String
    var score: Int
    var username: String
    
}

struct qq: View {
   
    var Users = [
        User(imageName: "Character", score: 8, username: "Raghad"),
        User(imageName: "Character", score: 6, username: "Malak"),
        User(imageName: "Character", score: 9, username: "Sana"),
        User(imageName: "Character", score: 2, username: "Lolo"),
        User(imageName: "Character", score: 1, username: "Norah"),
        User(imageName: "Character", score: 4, username: "Sana"),
        User(imageName: "Character", score: 0, username: "Manar"),
        User(imageName: "Character", score: 3, username: "Sara"),
        User(imageName: "Character", score: 5, username: "May")
       ].sorted(by: { $0.score > $1.score })
      
      var body: some View {
          
          ScrollView(showsIndicators: false){
              ForEach(0..<Users.count) { index in
                  ZStack {
                      Rectangle()
                          .fill(Color("LeaderBoardColor2").opacity(0.8))
                          .frame(width: 320 , height: 60)
                          .cornerRadius(15)
                      
                      HStack{
                          HStack{
                              Image("\(Users[index].imageName)")
                                  .resizable()
                                  .frame(width: 60 , height: 55)
                              Text("\(Users[index].username)")
                                  .font(.custom("basecoat", size: 16))
                                  .foregroundColor(.white)
                          }
                          Spacer()
                          
                          Text("\(Users[index].score)")
                              .font(.custom("basecoat", size: 18))
                              .foregroundColor(.white)
                          
                      }.padding(.leading, 40)
                          .padding(.trailing , 70)
                  }
              }// END Foreach
          }
      }
}


