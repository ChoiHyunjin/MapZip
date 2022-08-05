//
//  MapViewController.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/08.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MapView(frame: navigationController?.view.frame ?? .zero)
        
        view.addSubview(mapView)
        self.getRestaurants()
    }
    
    func getRestaurants(){
        let caller = APICaller.shared
        
        print("getRestaurants")
        caller.getRestaurantsByCoordination(latitude: 37.4847149, longitude: 126.9308361, level: 3, completion: {response in
            print(response)
        })
    }
}
