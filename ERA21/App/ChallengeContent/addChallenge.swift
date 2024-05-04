//
//  addChallenge.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct addChallenge: View {
    var body: some View {
        
        VStack(spacing:80){
            VStack(alignment: .leading , spacing: 12){
                Text("Create your challenge to achieve goals")
                    .font(.custom("basecoat-bold", size: 30))
                  
                
                Text("Choose a way to create your challenge")
                    .foregroundColor(.gray)
                    .font(.custom("basecoat", size: 16))
                
                
            }.padding()
            
            
            VStack{
          
                NavigationLink(destination: askpage()) {
                    Text("AI Challenge Generator")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.custom("basecoat", size: 20))
                        .bold()
                        .background(Color("MainColor"))
                        .cornerRadius(17)
                    
                }
                
                

                
                Button {
                    
                } label: {
                    Text("Create my own")
                        .frame(width: 285 , height: 50)
                        .foregroundColor(.white)
                        .font(.custom("basecoat", size: 20))
                        .bold()
                        .background(Color("MainColor"))
                        .cornerRadius(17)
                }

                
            }
            
            Spacer()
            
            
            
        }.padding()
        
        
        
    }
}







struct addChallenge_Previews: PreviewProvider {
    
    static var previews: some View {
        askpage()
    }
}








struct askpage :View{
    @State var isAddChallenge = false
    @EnvironmentObject var viewModel: ViewModel
    @State private var QuAi: String = ""
    @State var isActive = false

    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                VStack{
                    //before start, by defult isDataLoaded = false so, !false = true ✅
                    if !viewModel.isDataLoaded{ // true> not loding//finished
                        VStack{
                            
                            HStack {
                                Image(systemName: "pencil.line")
                                    .resizable()
                                    .frame(width: 25 , height: 25)
                                    .foregroundColor(Color("MainColor"))
                                    .padding(.leading, 10)
                                    .padding(.trailing, 4)
                                
                                TextField("Ask AI to make your challenge plan", text: $viewModel.challengeTitle)
                                    .foregroundColor(.black)
                                    .font(.custom("basecoat", size: 16))
                                
                            }
                            .frame(height: 50)
                            .background(Color("MainColor").opacity(0.1))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color("MainColor").opacity(0.1))
                                    .frame(height: 50)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                
                                HStack{
                                    Image(systemName: "stairs")
                                        .resizable()
                                        .frame(width: 25 , height: 25)
                                        .foregroundColor(Color("MainColor"))
                                        .padding(.leading, 10)
                                        .padding(.trailing, 4)
                                    
                                    Text(viewModel.selectedLevel.rawValue)
                                        .font(.custom("basecoat", size: 16))
                                    
                                        .foregroundColor(.black)
                                    
                                    
                                    
                                    Spacer()
                                    
                                    Menu {
                                        ForEach(ViewModel.EL.allCases) { level in
                                            Button(action: {
                                                viewModel.selectedLevel = level
                                            }) {
                                                Text(level.rawValue)
                                            }
                                        }
                                    } label: {
                                        
                                        
                                        Rectangle()
                                            .fill(Color("MainColor"))
                                            .frame(width: 55, height: 30 )
                                            .cornerRadius(10)
                                            .padding()
                                        
                                            .overlay {
                                                Text("Level")
                                                    .font(.custom("basecoat", size: 16))
                                                
                                                    .foregroundColor(.white)
                                                
                                                
                                                
                                            }
                                        
                                        
                                    }
                                    
                                    
                                }.padding()
                            }
                            
                            
                            
                            
                            
                            
                            
                        }
                        Spacer()
                        
                        VStack{
                            
                            
                            
                            
                            Button(action: {
                                viewModel.isDataLoaded = true// didn't finished
                                viewModel.handleUserInput{ms in
                                    // let array =
                                    viewModel.getTasks(from: ms){ _ in
                                        //self.viewModel.tasks //= array
                                        print(self.viewModel.tasks, "🧲")
                                        
                                        isActive = true
                                        viewModel.isDataLoaded = false// fineshed
                                        isAddChallenge = true
                                    }
                                }
                                
                                
                            }, label: {
                                Text("Continue")
                                    .frame(width: 280 , height: 50)
                                    .background(Color("MainColor"))
                                    .cornerRadius(15)
                                    .font(.custom("basecoat-bold", size: 24))
                                
                                    .foregroundColor(.white)
                            })
                            
                        }.padding(.bottom , 80)
                        
                    }
                    else{ // isDataLoaded = false, loading not finished
                        LoadingScreenChallenge()
                         
                            
                    }

                    
                }
                .padding()
                .fullScreenCover(isPresented: $isActive){
    
                    // LodingScreen()
                    Challenge()
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: ChallengeView()) {

                            Image(systemName: "xmark.circle")
                                .font(.title2)
                                .foregroundColor(Color("MainColor"))
                        }
                        

                        
                    }
                    
                }
                .navigationBarTitle("Challenge")
                    
                
                
            }
            .navigationBarBackButtonHidden(true)
            
            
            
        }
    }
}





