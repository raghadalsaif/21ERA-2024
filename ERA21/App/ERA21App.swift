//
//  ERA21App.swift
//  ERA21
//
//  Created by Nsreen Alfaifi on 19/11/1444 AH.
//

import SwiftUI

@main
struct ERA21App: App {
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
       //     ContentView()
           SplashScreenView()
                .environmentObject(vm)
           // ChatView()
        }
    }
}
