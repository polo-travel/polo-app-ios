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

class MapViewController: UIViewController, MGLMapViewDelegate {

    var mapView: NavigationMapView!
    var navigateButton: BasicButton!
    var directionsRoute: Route?
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapView = NavigationMapView(frame: view.bounds, styleURL: MGLStyle.lightStyleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(mapView)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        customNavigateButton()
        endButton()
        
        TravelService().currentTravel(){result  in
            
            if let user = result {
                print(user.daysDatas[0].morningActivity.localization[0])
            
                
                
                let numberDays = user.daysDatas.count
                for currentTravel in user.daysDatas{
                    print("start")
                    print(currentTravel)
                    
                    print(type(of: currentTravel.morningActivity.localization))
                    
                    print(currentTravel.morningActivity.localization)
                    print("end")
                }
                print(numberDays)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func popupAlert(sender: UIButton!){

        let alertVC = alertService.alert(title: "Ton activitée est terminée  !", body: "Comment l'as tu trouvé ?", buttonTitle: "" ) { [weak self] in
        }
        present(alertVC, animated: true)
    }
    
    func endButton(){
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
           button.setTitle("Activité Terminé", for: .normal)
           button.setTitleColor(.red, for: .normal)
           button.backgroundColor = UIColor.white
           button.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
           self.view.addSubview(button)
    }
    
    func customNavigateButton(){
        navigateButton = BasicButton(frame: CGRect(x:(view.frame.width/2 ) - 100, y: view.frame.height - 150, width: 200, height:50 ))
        navigateButton.setDarkButton()
        navigateButton.setTitle("NAVIGATE", for: .normal)
        navigateButton.layer.zPosition  = 9
        navigateButton.addTarget(self, action: #selector(navigateButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(navigateButton)
    }
    
    @objc func navigateButtonPressed(_ sender: BasicButton){
        mapView.setUserTrackingMode(.none, animated: true)

                    
        TravelService().currentTravel(){result  in
                   
           if let user = result {

          
            let MorningCoord = CLLocationCoordinate2D(latitude: user.daysDatas[0].morningActivity.localization[0], longitude: user.daysDatas[0].morningActivity.localization[1])
            
            let annotation = MGLPointAnnotation()
            annotation.coordinate = MorningCoord
            annotation.title = "Start Navigation"
            self.mapView.addAnnotation(annotation)
                                
            self.calculateRoute(from: (self.mapView.userLocation!.coordinate), to: MorningCoord) { (route, error) in
               if error != nil{
                   print("error getting route")
                }
            }
                    
            }
            
        }
        
    }
    
    
    func calculateRoute(from originCoord:CLLocationCoordinate2D, to destinationCoord: CLLocationCoordinate2D, completion:@escaping (Route?, Error?)-> Void){
        
        let origin = Waypoint(coordinate: originCoord, coordinateAccuracy: -1, name: "Start")
        let destination = Waypoint(coordinate: destinationCoord, coordinateAccuracy: -1, name: "Finish")
        
        let navigationOptions = NavigationRouteOptions(waypoints: [origin,destination], profileIdentifier: .automobileAvoidingTraffic)
        _ = Directions.shared.calculate(navigationOptions, completionHandler: {(waypoints, routes, error) in
            
            self.directionsRoute = routes?.first
            self.drawRoute(route: self.directionsRoute!)
            var coordinateBounce = MGLCoordinateBounds(sw: destinationCoord, ne: originCoord)
            let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
            let routeCam = self.mapView.cameraThatFitsCoordinateBounds(coordinateBounce, edgePadding: insets)
            
            self.mapView.setCamera(routeCam, animated: true)
            
            print(coordinateBounce)
            
        })
    }
    
    
    func drawRoute(route:Route){
    
        guard route.coordinateCount > 0 else{return}
        
        var routeCoordinates = route.coordinates!
        let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: route.coordinateCount)

        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource{
            source.shape = polyline
        } else{
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
            let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
            
            lineStyle.lineColor = NSExpression(forConstantValue: UIColor.red)
            lineStyle.lineWidth = NSExpression(format: "mgl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)",
            [14: 2, 18: 20])
            
            mapView.style?.addSource(source)
            mapView.style?.addLayer(lineStyle)
        }
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapView(_ mapView: MGLMapView, tapOnCalloutFor annotation: MGLAnnotation) {
        let navigationVC = NavigationViewController(for: directionsRoute!)
    
        present(navigationVC,animated: true,completion: nil)
        
    }
    
    
    

}
