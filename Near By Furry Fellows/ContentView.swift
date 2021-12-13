//
//  ContentView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/1/21.
//

import SwiftUI
import MapKit

struct Fellow: Identifiable {
    // furry fellows who hang out time near by coordinate.
    let id = UUID()
    let name: String
    let status: String
    let descLists: [String]
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @StateObject private var placeListVM = PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var searchTerm: String = ""
    
    let furryFellows = [
        Fellow(name: "Felix", status: "stray cat", descLists: ["Felix is kind and friendly.", "Felix is too friendly, I think he is indoor cat", "I took him to vet to check the chip on him, but no.", "oh...","Someone is looking for black cat near parkmerced, and I think it is Felix!"], coordinate: CLLocationCoordinate2D(latitude: 37.722548511737195, longitude: -122.48208693212523)),
        Fellow(name: "Tigger", status: "indoor cat likes to go out", descLists: ["Hi everyone, This is my cat Tigger, She is curious and fun who likes to hang out near my house. Please don't feed her snack. She is getting enough.", "I saw her yesterday at my backyard. she's a cutie"], coordinate: CLLocationCoordinate2D(latitude: 37.71856948428043, longitude: -122.48139363763083)),
        Fellow(name: "Cheetos", status: "community cats", descLists: ["I saw her yesterday, she seemed hungry so I fed her.", "oh Cheetos is feral cat lives near by. I think someone is feeding her regulaly.", "She got her with her moves. lol she likes to get special treats from people.", "yeah she got me too. I thought she was pregnent, but turns out it was food baby"], coordinate: CLLocationCoordinate2D(latitude: 37.72148075168351, longitude: -122.47812213135781))
    ]
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        // get current location
        guard let coordinate = placeListVM.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        VStack {
            NavigationView {
                
                Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: furryFellows)
                { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        NavigationLink {
                            FellowDetailView(place: place)
                        } label: {
                            
                            
                              
                            FellowView(title: place.name)
                              
                        }
                        
                        
                     
                                                    
                    }
                    
                }
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("Near by Furry Fellows")
                .navigationBarTitleDisplayMode(.inline)

            }

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
