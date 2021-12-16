//
//  addNewFellowView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/14/21.
//

import Foundation
import SwiftUI
import MapKit

struct addNewFellowView: View {
    @Binding var toggleSheetView: Bool
    @Binding var furryFellows: [Fellow]
    @State private var name = ""
    @State private var status = ""
    @State private var coordinate = CLLocationCoordinate2D(latitude: 37.72148075168351, longitude: -122.47812213135781)

    var body: some View {
        NavigationView {
            VStack{
                Text("Did you meet New furries?")
                    .font(.title)
                Divider()
                TextField("Name: ", text: $name,
                onCommit: {
                    print("name typed: \(name)")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.orange,width: 2)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                TextField("status: ", text: $status,
                onCommit: {
                    print("status typed: \(status)")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.orange, width: 2)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
           
                if (name.count != 0) && (status.count != 0) {
                    //furryFellows.append(Fellow(_name: name, _status: status, _descLists: [""], _coordinate: coordinate))
                    
                }
            }.background(Color.orange)
            .navigationBarTitle(Text("Add a new Fellow"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                        self.toggleSheetView = false
                    }) {
                        Text("Done").bold()
                    })
        

        
        }
        
        
    }
    
}


