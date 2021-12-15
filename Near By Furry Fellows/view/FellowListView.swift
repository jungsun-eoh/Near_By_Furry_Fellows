//
//  FellowListView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/13/21.
//

import Foundation
import SwiftUI

struct FellowListView: View {
    
    let furryFellows: [Fellow]
    
    var body: some View {
        List(furryFellows, id: \.id) {
            fFellow in
            VStack(alignment: .leading, spacing: 10) {
                Text(fFellow.name).font(.title)
                Text(fFellow.status).font(.headline)
            }
        }
    }
}

