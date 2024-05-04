//
//  ChallengesByPrice.swift
//  21era
//
//  Created by Nsreen Alfaifi on 13/11/1444 AH.
//

import SwiftUI


//var isSubscribed: Bool
//var numberofchallenges: String
//var Price: String



struct ChallengesByPrice: View {
    @State private var isSubscriber = false
    @State private var selectedPackage: Int? = nil
    
    @State private var ChallengePrice = challengesPrice(isSubscribed: false , numberofchallenges: "3", Price: "")
    
    let Pakges = [ "19.00 SR " ,"29.00 SR " ,"39.00 SR " ]
    
    var body: some View {
        ScrollView {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 1 ) {
                    ForEach(0..<Pakges.count) { index in
                        
                        ZStack{
                        ChallengesByPriceCards()
                        
                            VStack(alignment: .leading, spacing: 30 ){
                                Text(Pakges[index])
                                    .font(.custom("basecoat-bold", size: 30))
                                    .foregroundColor(Color.white)
                                    .padding(.trailing , 60)
                                Text("For \(index+1) AI Challenge" )
                                    .font(.custom("basecoat-bold", size: 20))
                                    .foregroundColor(Color.white)
                                    .padding(.trailing , 60)
                            }
                            
                        }
                            .padding()
                        
                    }
                }
            }
        }

    }
}


struct ChallengesByPriceCards: View {
    
    @State private var ChallengePrice = challengesPrice(isSubscribed: false , numberofchallenges: "3", Price: "")
    
    let Pakges = [ "19.00 SR " ,"29.00 SR " ,"39.00 SR " ]
 
    
    
    
    var body: some View {
        
        ZStack{
            
            
         
     
                    Button {
                        //
                        
                    } label: {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("price1") ,  Color("price2")]), startPoint: .trailing , endPoint: .leading))
                            .frame(width: 270 , height: 150 )
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                         
                        
                    }
                    
                    
                
            
     
            
            
        }
        
    }
}


struct ChallengesByPrice_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesByPrice()
    }
}










////////////////////

struct aa: View {
    @State private var isSubscriber = false
    @State private var selectedPackage: Int? = nil

    var body: some View {
        HStack {
            
            
            
            if isSubscriber {
                Text("You are a subscriber.")
                    .font(.title)
                    .padding()
                if let selectedPackage = selectedPackage {
                    Text("Selected Package: \(selectedPackage) template(s)")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            } else {
              
                
                
                Button {
                    //
                    selectPackage(package: 1)
                } label: {
                 
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("FontLargeTitle"), Color("sceondColor")]), startPoint: .trailing , endPoint: .leading))
                        .frame(width: 280 , height: 160 )
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5 , x: 0, y: 0)
                        
                }

                Button {
                    //
                    selectPackage(package: 2)
                    
                } label: {
                 
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("FontLargeTitle"), Color("sceondColor")]), startPoint: .trailing , endPoint: .leading))
                        .frame(width: 280 , height: 160 )
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5 , x: 0, y: 0)
                        
                }

                Button {
                    //
                    selectPackage(package: 3)
                } label: {
                 
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("FontLargeTitle"), Color("sceondColor")]), startPoint: .trailing , endPoint: .leading))
                        .frame(width: 280 , height: 160 )
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5 , x: 0, y: 0)
                        
                }
            }
        }
        .onAppear {
            // Fetch user's subscription status and selected package from the backend
            fetchSubscriptionData()
        }
    }

    func fetchSubscriptionData() {
        // Make an API call to fetch the user's subscription status and selected package
        // Example API call using URLSession:
        guard let url = URL(string: "https://your-backend.com/api/subscriptions") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching subscription data: \(error)")
                return
            }

            if let data = data {
                // Parse the response data and update the local state variables
                // Example response parsing assuming JSON format:
                if let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    isSubscriber = response["isSubscriber"] as? Bool ?? false
                    selectedPackage = response["selectedPackage"] as? Int
                }
            }
        }.resume()
    }

    func selectPackage(package: Int) {
        // Update the selected package locally
        selectedPackage = package

        // Make an API call to update the selected package on the backend
        // Example API call using URLSession:
        guard let url = URL(string: "https://your-backend.com/api/selected-package") else {
            return
        }

        let parameters: [String: Any] = [
            "selectedPackage": package
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error updating selected package: \(error)")
                return
            }

            // Handle the response from the backend if needed
        }.resume()
    }
}
