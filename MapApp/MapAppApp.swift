//
//  MapAppApp.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var manager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
