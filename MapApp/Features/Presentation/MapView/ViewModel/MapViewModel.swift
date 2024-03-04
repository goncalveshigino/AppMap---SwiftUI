//
//  MapViewModel.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import Foundation
import Observation
import MapKit
import SwiftUI

enum MyMapStyle: Int {
    case standard = 0
    case imagery
    case hybrid
    
    func toMapStyle() -> MapStyle {
        switch self {
        case .standard: return .standard
        case .imagery:  return .imagery
        case .hybrid:   return .hybrid
        }
    }
    
    func toggle() -> MyMapStyle {
        switch self {
        case .standard: return .imagery
        case .imagery:  return .hybrid
        case .hybrid:   return .standard
        }
    }
}

@Observable class MapViewModel {
    
    var cameraPosition: MapCameraPosition
    var location: CLLocation?
    var region: MKCoordinateRegion
    var mapSelection: MKMapItem?
  
    var mapStyle: MyMapStyle = .standard
    
    var isLoading: Bool = false
    
    var viewingRegion: MKCoordinateRegion?
    
    init(location: CLLocation?,region: MKCoordinateRegion) {
        self.cameraPosition = .region(region)
        self.location = location
        self.region = region
    }
}
