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
    @State var place: Fellow
    @State private var newText: String = ""
    
    var body: some View {
        VStack() {
          Text(place.status)
            .font(.headline)
            Divider()
            Spacer()
            ForEach(place.descLists, id: \.self) {
                desc in
                Text("\(desc.description)")
                    .background(Color.blue.opacity(0.2))
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("")
            }
            Spacer()
            TextField("Did you see this fellow?", text: $newText, onEditingChanged:
                        {(isBegin) in
                if isBegin {
                    print("Begins editing")
                } else {
                    print("Finishes editing")
                }
            },
            onCommit: {
                place.descLists.append(newText)
                print("Committed: \(newText)")
                newText = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(Color.yellow,width: 2)
        }
        .navigationTitle(place.name)
      }
}

struct PlaceDetailView_Previews: PreviewProvider {
  static var previews: some View {
      FellowDetailView(place: Fellow(name: "Fellow name", status: "Fellow status", descLists: ["description"], coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)))
  }
}
