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
        let marker = NMFMarker.init(position: NMGLatLng(lat: 14145127.7125430, lng: 4514239.3196558))
        NMFMarker.init(position: NMGLatLng(lat: 4514239.3196558, lng: 14145127.7125430)).mapView = self.mapView
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
