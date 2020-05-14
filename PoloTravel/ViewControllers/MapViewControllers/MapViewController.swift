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

    var alertService = AlertService()
    var mapView: NavigationMapView!
    var navigateButton: BasicButton!
    var directionsRoute: Route?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        mapView = NavigationMapView(frame: view.bounds, styleURL: MGLStyle.lightStyleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(mapView)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        customNavigateButton()
        
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
        

        displayAsyncPopUp()
        
        // Do any additional setup after loading the view.
    }
    func displayAsyncPopUp(){
      
    
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0 ){
           // let alertVC = self.alertService.alert(title: "Bien arrivé ?", body: "C’est parti pour te jeter dans les airs avec « iFLY Lyon » ! \n\n Tu ne trouves pas ? Contacte-les ! 04 82 90 34 70", buttonTitle: "Je suis bien arrivé" ) { [weak self] in}
            self.present(serviceAlert.alert, animated: true)
            serviceAlert.alert.actionButton.addTarget(self, action: #selector(self.switchText), for: .touchUpInside)

            serviceAlert.alert.ratingStackView.isHidden = true
        }
        
    

    }
    
    
    @objc func switchText(sender: BasicButton!){


        serviceAlert.body?.text = "Laisse ton téléphone de côté et on se retrouve après."
        serviceAlert.title?.text = "Profite de ton activité"
        serviceAlert.button?.setTitle("Activité est fini", for: .normal)


        print(serviceAlert.body?.text)
        
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

                    
        TravelService().currentTravel(){ result  in
                   
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

struct serviceAlert {
    static var values = ["VALUE 1", "VALUE 222222"]
    
   static var createAlertService = AlertService()
   static var alert = serviceAlert.createAlertService.alert(title: "Bien arrivé ?", body: "C’est parti pour te jeter dans les airs avec « iFLY Lyon » ! \n\n Tu ne trouves pas ? Contacte-les ! 04 82 90 34 70",  buttonTitle: "Je suis bien arrivé"){}
    static var body = serviceAlert.alert.bodyLabel
    static var title = serviceAlert.alert.titleLabel
    static var button = serviceAlert.alert.actionButton
    
}

