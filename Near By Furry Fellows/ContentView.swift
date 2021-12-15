//
//  ContentView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/1/21.
//

import SwiftUI
import MapKit

struct Fellow: Identifiable {
    let id = UUID()
    var name: String
    var status: String
    var descLists: [String]
    var coordinate: CLLocationCoordinate2D
    
    init(_name: String, _status: String, _descLists: [String], _coordinate: CLLocationCoordinate2D) {
        name = _name
        status = _status
        coordinate = _coordinate
        
        if _descLists.isEmpty {
            descLists = [""]
        } else {
            descLists = _descLists
        }
    }
}

enum DisplayType {
    case map
    case list
}

struct ContentView: View {
    @StateObject private var placeListVM = PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var searchTerm: String = ""
    @State private var displayType: DisplayType = .map
    @State var toggleSheetView = false
    
    
    @State var furryFellows = [
        Fellow(_name: "Felix", _status: "stray cat", _descLists: ["Felix is kind and friendly.", "Felix is too friendly, I think he is indoor cat", "I took him to vet to check the chip on him, but no.", "oh...","Someone is looking for black cat near parkmerced, and I think it is Felix!"], _coordinate: CLLocationCoordinate2D(latitude: 37.722548511737195, longitude: -122.48208693212523)),
        Fellow(_name: "Tigger", _status: "indoor cat likes to go out", _descLists: ["Hi everyone, This is my cat Tigger, She is curious and fun who likes to hang out near my house. Please don't feed her snack. She is getting enough.", "I saw her yesterday at my backyard. she's a cutie"], _coordinate: CLLocationCoordinate2D(latitude: 37.71856948428043, longitude: -122.48139363763083)),
        Fellow(_name: "Cheetos", _status: "community cats", _descLists: ["I saw her yesterday, she seemed hungry so I fed her.", "oh Cheetos is feral cat lives near by. I think someone is feeding her regulaly.", "She got her with her moves. lol she likes to get special treats from people.", "yeah she got me too. I thought she was pregnent, but turns out it was food baby"], _coordinate: CLLocationCoordinate2D(latitude: 37.72148075168351, longitude: -122.47812213135781))
    ]
    
    func getRegion() -> Binding<MKCoordinateRegion> {
        guard let coordinate = placeListVM.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        VStack {
            Picker("Select", selection:$displayType) {
                Text("Map").tag(DisplayType.map)
                Text("List").tag(DisplayType.list)
            }.pickerStyle(SegmentedPickerStyle())
            
            if displayType == .map {
                NavigationView {
                    Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: furryFellows)
                    { place in
                        MapAnnotation(coordinate: place.coordinate) {
                            
                            NavigationLink {
                                FellowDetailView(place: place)
                            } label: {
                                FellowMapView(title: place.name)
                            }
                        }
                    }
                    .ignoresSafeArea(edges: .bottom)
                    .navigationBarTitle("Near by Furry Fellows")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.toggleSheetView.toggle()
                        }) {
                            Image(systemName: "plus")
                
                        }
                    )
                }.sheet(isPresented: $toggleSheetView) {
                    addNewFellowView(toggleSheetView: self.$toggleSheetView, furryFellows: $furryFellows)
                }
            } else {
                FellowListView(furryFellows: furryFellows)
            }
            
            
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
