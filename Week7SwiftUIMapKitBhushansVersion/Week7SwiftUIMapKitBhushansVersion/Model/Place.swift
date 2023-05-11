//
//  Place.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import Foundation

import CoreLocation
struct Place : Identifiable {
    let id = UUID()
    let name : String
    let coordinates : CLLocationCoordinate2D
}
