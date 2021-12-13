//
//  PlaceDetailView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/10/21.
//

import Foundation
import SwiftUI
import MapKit

struct PlaceDetailView: View {
    let place: Fellow
    
    var body: some View {
        VStack(spacing: 20) {
          Text(place.name)
            .font(.title)
          
          Text(place.status)
            .font(.title2)
            Text(place.description.description)
              .font(.title3)

        }
        .navigationTitle(place.name)
      }
}
extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
      "\(self.description)"
  }
}

struct PlaceDetailView_Previews: PreviewProvider {
  static var previews: some View {
      PlaceDetailView(place: Fellow(name: "Fellow name", status: "Fellow status", description: ["description"], coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)))
  }
}
