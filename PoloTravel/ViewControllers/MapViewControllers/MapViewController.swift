//
//  MapViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 03/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Mapbox
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)


        // Do any additional setup after loading the view.
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
