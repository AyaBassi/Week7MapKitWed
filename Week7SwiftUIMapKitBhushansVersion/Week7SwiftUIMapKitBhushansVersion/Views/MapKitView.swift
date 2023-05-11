//
//  ContentView.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import SwiftUI
import MapKit
enum LocationDetails {
    static let center = CLLocationCoordinate2D(latitude: 51.4, longitude: 0.2)
    static let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}

struct MapKitView: View {
    @StateObject var viewModel = LocManMapViewModel()
    @State var staticRegion = MKCoordinateRegion(center: LocationDetails.center, span: LocationDetails.span)
    
    var region: Binding<MKCoordinateRegion>?{
        guard let currentLocation = viewModel.currentLocation else {
            return MKCoordinateRegion(center: LocationDetails.center, span: LocationDetails.span).getBinding()
        }
        let region = MKCoordinateRegion(center: currentLocation.coordinate, span: LocationDetails.span)
        return region.getBinding()
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                if let currentRegion = region {
                    Map(coordinateRegion: currentRegion, annotationItems: [Place(name: "Camden", coordinates: CLLocationCoordinate2D(latitude:51.5 , longitude:0.087 ))]) { place in
                        MapAnnotation(coordinate: place.coordinates) {
                            NavigationLink {
                                PlaceDetailsView(place: place)
                            } label: {
                                AnnotationView(title: place.name)
                            }
                        }
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct MapKitView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitView()
    }
}
