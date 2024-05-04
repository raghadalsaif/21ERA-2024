//
//  Picker21ERA.swift
//  21era
//
//  Created by Nsreen Alfaifi on 16/11/1444 AH.
//

import SwiftUI

struct Picker21ERA: View {
    @State private var selectedOption: Int = 0
    let options = ["Profile" , "LeaderBoard"]
    
    var body: some View {
   
        Picker("", selection: $selectedOption) {
            ForEach(0..<options.count) { index in
                Text(options[index])
                    .tag(index)
                
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 350)
        .padding()
        
    
        if selectedOption == 0 {
            Profile()
            
             
        }else{
            LeaderBoard()
         
      
        }
       

    }
}

struct Picker21ERA_Previews: PreviewProvider {
    static var previews: some View {
        Picker21ERA()
    }
}
