//
//  MapView.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/20.
//

import Foundation
import NMapsMap
class MapView: NMFNaverMapView{
    var locationManager: CLLocationManager?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let marker = NMFMarker.init(position: NMGLatLng(lat: 37.5386422, lng: 127.0603975))
        marker.mapView = self.mapView
        setLocation()
        setMapView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocation(){
        self.locationManager = CLLocationManager()
        guard let locationManager = locationManager else { return }
        locationManager.requestWhenInUseAuthorization()
    }
    
    func setMapView(){
        self.showLocationButton = true
        self.mapView.locationOverlay.hidden = false
    }
}
