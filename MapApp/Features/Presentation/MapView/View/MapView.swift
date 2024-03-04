//
//  MapView.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import SwiftUI
import Observation
import MapKit

struct MapView: View {
   @Bindable var viewModel: MapViewModel
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Map(position: $viewModel.cameraPosition, selection: $viewModel.mapSelection){
            
        }
    }
}


