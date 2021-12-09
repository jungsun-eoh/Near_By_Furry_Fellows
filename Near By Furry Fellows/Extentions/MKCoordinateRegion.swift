//
//  MKCoordinateRegion.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/7/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.72369516982554, longitude: -122.47558995901251), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    }
}
