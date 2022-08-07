//
//  MapViewController.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/08.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    var mapView: MapView? = nil
    var markers: [NMFMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MapView(frame: navigationController?.view.frame ?? .zero)
        
        view.addSubview(mapView)
        self.mapView = mapView
        self.getRestaurants()
    }
    
    func getRestaurants(){
        let caller = APICaller.shared
        
        caller.getRestaurantsByCoordination(latitude: 37.4847149, longitude: 126.9308361, level: 3, completion: {response in
            switch response.result {
            case .success(let restaurants):
                self.mapView?.setRestaurants(restaurants: restaurants.result)
                break
            case .failure(let error):
                debugPrint("error:\(error)")
                break
            }
        })
    }
}
