
////
//  FriendsPage.swift
//  21era
//
//  Created by Nsreen Alfaifi on 14/11/1444 AH.
//

import SwiftUI

struct FriendsPage: View {
    @State private var selectedOptionIndex = 0
    @State private var searchTextFriends = ""
    @State private var searchTextRequests = ""
    let options = ["Friends", "Requests"]
    
   
    
    var filteredFriends: [String] {
        if searchTextFriends.isEmpty {
            return friendsData
        } else {
            return friendsData.filter { $0.localizedCaseInsensitiveContains(searchTextFriends) }
        }
    }
    
    var body: some View {
        VStack {
            Picker(selection: $selectedOptionIndex, label: Text("Options")) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 350)
            
            if selectedOptionIndex == 0 {
                SearchBar(text: $searchTextFriends, placeholder: "     Search Friends")
                FriendsCardGrid(friends: filteredFriends)
            } else {
                
                SearchBar(text: $searchTextRequests, placeholder: "     Search For Friends to Add")
                
                if searchTextRequests.isEmpty {
                    RequestView(requests: ["Fahda", "Sumi", "Samirah"])
                }else{
                    
                    invitView(invites: ["Nore", "Maha", "Safa"])
                }
            }
        }
        .navigationTitle("Friends")

       
    }
}

struct FriendsPage_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPage()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack{
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
              
            
            HStack(spacing: 300) {
                Image(systemName: "magnifyingglass")
                    .opacity(text.isEmpty ? 1 : 0)
                
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .opacity(text.isEmpty ? 0 : 1)
                }
            }
             
            .padding(.horizontal)
        }
    }
}

let friendsData = ["Sanaa", "Shaden", "Razan", "Malak", "Raghad"]

struct FriendsCardGrid: View {
    let friends: [String]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: -40) {
                ForEach(friends, id: \.self) { friend in
                    NavigationLink(destination: FriendDetailPage(friendName: friend)) {
                        FriendsCardView(friendName: friend)
                        
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct FriendsCardView: View {
    let friendName: String
    
    var body: some View {
        VStack {
            Image("CharacterBackground")
                .resizable()
                .frame(width: 170, height: 150)
                .cornerRadius(12)
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                .overlay(
                    Image("Character")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .padding(.top, 20)
                        .overlay(
                            Rectangle()
                                .frame(width: 170, height: 32)
                                .foregroundColor(Color.white).blur(radius: 0.9).opacity(0.98)                                .padding(.top, 115)
                                .cornerRadius(12)
                                .overlay(
                                    HStack(spacing: 80) {
                                        Text(friendName)
                                            .foregroundColor(.black)
                                            .font(.custom("basecoat", size: 14))
                                       
                                        Button {
                                            // Handle friend card button action
                                        } label: {
                                            Image(systemName: "hands.clap")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("MainColor"))
                                        }
                                    }
                                    .padding(.top, 115)
                                )
                        )
                )
                .padding(.top)
        }
    }
}

struct FriendDetailPage: View {
    let friendName: String
     let  FrindChallengNmae = "Learn SwiftUI"
    @State private var progress: CGFloat = 0.6
    
    var body: some View {
                
        VStack{
           
            Divider()
                .padding()
            Image("CharacterBackground")
                .resizable()
                .frame(width: 300, height: 280)
                .cornerRadius(12)
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                .overlay(
                    Image("Character")
                        .resizable()
                        .frame(width: 250, height: 220)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .padding(.top, 20)
                    
                    
                    )
            VStack(alignment: .leading){
                
                Text(FrindChallengNmae)
                    .font(.title)
                Divider()
                
                VStack(alignment: .leading , spacing: 16){
                    Text("Progress")
                        .font(.title)
                    ProgressView(value: progress)
                     //   .progressViewStyle(MyProgressViewStyle(progressColor: Color("MainColor")))
                       
                }
                
            }.padding()
            
            Spacer()
                
                .navigationTitle(friendName)
                
        }

        
        
        
        
                    
    }
}

struct RequestView: View {
    let requests: [String]

    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(requests, id: \.self) { request in
                    RequestCardView(requestName: request)
                }
                
          
            }
            .padding(.top)
        }
    }
}
    
    
struct invitView: View {
       
        let invites: [String]
        
        var body: some View {
            VStack {
                ScrollView {
                                   
                    ForEach(invites, id: \.self) { invite in
                        InviteCardView(inviteName: invite)
                    }
                }
                .padding(.top)
            }
        }
    }


struct RequestCardView: View {
    let requestName: String
    
    var body: some View {
        ZStack {
            requestShape()
            
            HStack {
                Text(requestName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: -20) {
                    Button {
                        // Handle reject button action
                    } label: {
                        Rectangle()
                            .fill(Color("rejectColor"))
                            .frame(width: 60, height: 30)
                            .cornerRadius(15)
                            .padding()
                            .overlay {
                                Image(systemName: "person.fill.xmark")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                    }
                    
                    Button {
                        // Handle accept button action
                    } label: {
                        Rectangle()
                            .fill(Color("MainColor"))
                            .frame(width: 60, height: 30)
                            .cornerRadius(15)
                            .padding()
                            .overlay {
                                Image(systemName: "person.fill.checkmark")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                    }
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 30)
        }
    }
}

struct InviteCardView: View {
    let inviteName: String
    
    var body: some View {
        ZStack {
            requestShape()
            
            HStack {
                Text(inviteName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    // Handle invite button action
                } label: {
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: 60, height: 30)
                        .cornerRadius(15)
                        .padding()
                        .overlay {
                            Text("invite")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 30)
        }
    }
}

struct requestShape: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("FrindsCards"))
                .frame(width: 330, height: 50)
                .cornerRadius(10)
        }
    }
}

