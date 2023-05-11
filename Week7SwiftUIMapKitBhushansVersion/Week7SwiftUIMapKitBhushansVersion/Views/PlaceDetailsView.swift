//
//  PlaceDetailsView.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import SwiftUI
import CoreLocation
struct PlaceDetailsView: View {
    var place : Place
    var body: some View {
        VStack{
            Text(place.name)
            Text("\(place.coordinates.latitude)")
            Text("\(place.coordinates.longitude)")
        }
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView(place: Place(name: "Camden", coordinates: CLLocationCoordinate2D(latitude:51.5 , longitude:0.087 )))
    }
}
