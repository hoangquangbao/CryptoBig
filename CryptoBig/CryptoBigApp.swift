//
//  CryptoBigApp.swift
//  CryptoBig
//
//  Created by Quang Bao on 21/05/2022.
//

import SwiftUI
    
@main
struct CryptoBigApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
