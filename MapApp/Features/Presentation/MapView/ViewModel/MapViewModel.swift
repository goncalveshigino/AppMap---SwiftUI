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

@Observable class MapViewModel {
    
    var cameraPosition: MapCameraPosition
    var location: CLLocation?
    var region: MKCoordinateRegion
    var mapSelection: MKMapItem?
  
    
    init(location: CLLocation?,region: MKCoordinateRegion) {
        self.cameraPosition = .region(region)
        self.location = location
        self.region = region
    }
}
