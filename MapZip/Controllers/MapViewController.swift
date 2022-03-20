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

        let mapView = MapView(frame: view.frame)
        
        view.addSubview(mapView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension MapViewController : NMFMapViewTouchDelegate{
//
//}
