//
//  MapViewComponents.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import SwiftUI

extension MapView {
    
    var topTrailingOverlayView: some View {
        VStack(spacing: -5) {
            IconView(systemName: "map.fill")
                .onTapGesture {
                    self.viewModel.mapStyle = viewModel.mapStyle.toggle()
                }
            
            if viewModel.isLoading {
                ProgressView()
                    .font(.title3)
                    .background(
                      RoundedRectangle(cornerRadius: 10)
                        .frame(width: 44, height: 46)
                        .foregroundColor(.init(.systemBackground))
                    )
                    .padding()
            } else {
                IconView(systemName: "location.fill")
                    .onTapGesture {
                        withAnimation {
                            viewModel.cameraPosition = .region(viewModel.region)
                        }
                    }
            }
        }
    }
}


