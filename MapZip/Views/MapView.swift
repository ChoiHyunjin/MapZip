//
//  MapView.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/20.
//

import Foundation
import NMapsMap

protocol ZoneMarkerDelegate{
    func onTapZone(_ zone:Zone)
}

class MapView: NMFNaverMapView{
    var locationManager: CLLocationManager?
    
    var markerDelegate: ZoneMarkerDelegate?
    var zones: [Zone]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let marker = NMFMarker.init(position: NMGLatLng(lat: 37.5386422, lng: 127.0603975))
        marker.mapView = self.mapView
        setLocation()
        setMapView()
        configureLocation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMarkers(){
        guard let zones = zones else { return }
        let status = self.getLocationAuthorize()
        if status == .none {
            return
        }
        for zone in zones{
            addMarker(zone: zone)
        }
    }
    
    func addMarker(zone: Zone){
        let marker = NMFMarker.init(position: NMGLatLng(lat: zone.location.lat, lng: zone.location.lng))
        marker.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.moveTo(zone, completion: { [weak self] (isCancelled: Bool) in
                guard let markerDelegate = self?.markerDelegate else { return }
                markerDelegate.onTapZone(zone)
            })
            return true
        }
        marker.iconImage = NMFOverlayImage(name: "img_zone_shadow")
        marker.mapView = self.mapView
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
    
    func setCurrentLocation(animation: NMFCameraUpdateAnimation = .linear){
        guard let coordinate = locationManager?.location?.coordinate else { return }
        let latLng = NMGLatLng(lat: coordinate.latitude, lng: coordinate.longitude)
        let cameraUpdate = NMFCameraUpdate(scrollTo: latLng)
        cameraUpdate.animation = animation
        self.mapView.moveCamera(cameraUpdate)
        
        mapView.locationOverlay.location = latLng
    }
    
    func moveTo(_ zone: Zone,
                animation: NMFCameraUpdateAnimation = .linear,
                completion: ((Bool)->Void)? = nil){
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: zone.location.lat, lng:  zone.location.lng))
        cameraUpdate.animation = animation
        self.mapView.moveCamera(cameraUpdate, completion: completion)
    }
    
    private func setCurrentLocation(by status: CLAuthorizationStatus){
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            self.setCurrentLocation()
            break
        default:
            break
        }
    }
    
    private func getLocationAuthorize() -> CLAuthorizationStatus? {
        guard let locationManager = locationManager else { return nil }
        if #available(iOS 14.0, *) {
            return locationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
    }
    
    private func configureLocation(){
        self.locationManager = CLLocationManager()
        locationManager?.delegate = self
        guard let locationManager = locationManager else { return }
        locationManager.requestWhenInUseAuthorization()
        
        let camera = NMFCameraUpdate(zoomTo: 15.0)
        self.mapView.moveCamera(camera)
        guard let authStatus = self.getLocationAuthorize() else { return }
        switch authStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            self.setCurrentLocation()
            break
        default:
        self.moveTo(Zone(id: "", name: "", alias: "",
                         location: Location(lat: 37.54330366639085, lng: 127.04455548501139)))
            break
            
        }
    }
}

extension MapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.setCurrentLocation(by: status)
        setMarkers()
    }
}
