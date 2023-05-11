//
//  LocManMapViewModel.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//
import SwiftUI
import MapKit
class LocManMapViewModel:NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var currentLocation : CLLocation?
    
    private var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: in LocManMapViewModel \(error.localizedDescription)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorisation()
    }
    
    private func checkLocationAuthorisation(){
        switch locationManager.authorizationStatus {
        case .notDetermined:
//            if CLLocationManager.locationServicesEnabled() {
//                locationManager.requestWhenInUseAuthorization()
//            }
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied this app location permission.Go into settings to change it")
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
}

extension MKCoordinateRegion{
    func getBinding () -> Binding<MKCoordinateRegion>?{
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
