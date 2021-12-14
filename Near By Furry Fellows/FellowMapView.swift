//
//  FellowView.swift
//  Near By Furry Fellows
//
//  Created by Jungsun Eoh on 12/10/21.
//

import Foundation
import SwiftUI
import MapKit

struct FellowMapView: View {
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "pawprint.fill")
                .foregroundColor(.red)
            Text(title)
                .fixedSize()
        }.padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .overlay(
            Image(systemName: "arrowtriangle.left.fill")
                .rotationEffect(Angle(degrees: 270))
                .foregroundColor(.white)
                .offset(y: 10)
            
            , alignment: .bottom)
    }
    
}

struct FellowView_Previews: PreviewProvider {
  static var previews: some View {
      FellowMapView(title: "Fellows view")
      .background(Color.gray)
  }
}
