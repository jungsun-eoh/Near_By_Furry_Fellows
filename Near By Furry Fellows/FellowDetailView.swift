//
//  PlaceDetailView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/10/21.
//

import Foundation
import SwiftUI
import MapKit

struct FellowDetailView: View {
    let place: Fellow
    
    var body: some View {
        VStack(spacing: 20) {
          Text(place.status)
            .font(.headline)
            
            ForEach(place.descLists, id: \.self) {
                desc in
                Text("\(desc.description)")
                    .font(.footnote)
            }
        }
        .navigationTitle(place.name)
      }
}

struct PlaceDetailView_Previews: PreviewProvider {
  static var previews: some View {
      FellowDetailView(place: Fellow(name: "Fellow name", status: "Fellow status", descLists: ["description"], coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)))
  }
}
