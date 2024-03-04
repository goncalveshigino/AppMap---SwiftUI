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
    
   @State var showErrorAlert: Bool = false
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Map(position: $viewModel.cameraPosition, selection: $viewModel.mapSelection){
                UserAnnotation()
                
                if viewModel.lookAroundScene != nil {
                    if let coordinate = viewModel.viewingRegion?.center {
                        Annotation("Library", coordinate: coordinate) {
                            
                        }
                    }
                }
            }
            .mapStyle(viewModel.mapStyle.toMapStyle())
            .onMapCameraChange { ctx in
                viewModel.viewingRegion = ctx.region
            }
            .overlay(alignment: .topTrailing) {
                topTrailingOverlayView
            }
            .overlay(alignment: .bottomTrailing) {
                bottomTrailingOverlayView
            }
            .overlay(alignment: .bottomLeading) {
                if !viewModel.routeDisplaying {
                    bottomLeadingOverlayView
                }
            }
        }.alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Important message"), message: Text("Unexpected error is happen"), dismissButton: .default(Text("Got it!")))
        }
    }
}


