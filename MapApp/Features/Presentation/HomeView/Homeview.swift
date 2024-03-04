//
//  Homeview.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import SwiftUI

struct Homeview: View {
    @EnvironmentObject private var manager: LocationManager
    
    var body: some View {
        if let location = manager.location, 
           let region = manager.region {
            MapView(viewModel: MapViewModel(location: location, region: region))
        } else {
            ProgressView()
        }
       
    }
}

//#Preview {
//    Homeview()
//}
