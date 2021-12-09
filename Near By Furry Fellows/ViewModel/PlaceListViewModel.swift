//
//  PlaceListViewModel.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/7/21.
//

import Foundation
import Combine
import CoreLocation
import MapKit

class PlaceListViewModel: ObservableObject {
    
    private let locationManager: LocationManager
    var cancellable: AnyCancellable?
    @Published var currentLocation: CLLocationCoordinate2D?
    
    init() {
        locationManager = LocationManager()
        
        cancellable = locationManager.$location.sink { (location) in
            if let location = location {
                DispatchQueue.main.async {
                    self.currentLocation = location.coordinate
                }
            }
        }
    }
    
    func searchLandmakrs(searchTerm: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        
        let search = MKLocalSearch(request: request)
        search.start {(response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                let mapItems = response.mapItems
                print(mapItems)
            }
        }
    }
}
