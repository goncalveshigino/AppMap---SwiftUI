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

// MARK: - Bottom Trailing Overlay View
extension MapView {
    var bottomTrailingOverlayView: some View {
        HStack(spacing: -10) {
            IconView(systemName: "sun.min.fill", imageColor: .yellow)
                .offset(x: -10)
            Text("140º")
                .foregroundColor(.init(.gray))
                .font(.title3)
                .offset(x: -13)
                
        }.background(
           RoundedRectangle(cornerRadius: 10)
            .frame(width: 62, height: 46)
            .foregroundColor(.init(.systemBackground))
        ).offset(y: -100)
    }
}

extension MapView {
    var bottomLeadingOverlayView: some View {
        HStack(spacing: -10) {
            IconView(systemName: "binoculars.fill", imageColor: .yellow)
                .frame(width: 62, height: 46)
                .offset(x: -100)
                .onTapGesture {
                    Task {
                        guard let coordinate = viewModel.viewingRegion?.center else {
                            showErrorAlert = true
                            return
                        }
                        
                        await viewModel.fetchLookAroundPreview(coordinate: coordinate)
                        viewModel.isLoading = false
                    }
                }
                
        }
    }
}


