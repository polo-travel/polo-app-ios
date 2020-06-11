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
    

    @IBOutlet weak var popinContent: UILabel!
    @IBOutlet weak var popinTitle: UILabel!
    
    @IBOutlet weak var popIn: UIView!
    @IBOutlet weak var polo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        mapView = NavigationMapView(frame: view.bounds, styleURL: MGLStyle.lightStyleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(mapView)
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        
        TravelService().currentTravel(){result  in
            
            if let user = result {

                let numberDays = user.daysDatas.count
                for currentTravel in user.daysDatas{
                    print("start")

                    for item in currentTravel.items{
                        let header:String? = item.value(forKey: "header") as? String
                        
                        if let head = header{
                            print(head)
                        }
                    }
                    
                    print("end")
                }
                print(numberDays)
            }
        }
        
        customPopIn()
        self.view.bringSubviewToFront(polo)
        self.view.bringSubviewToFront(popIn)


            
        // Do any additional setup after loading the view.
    }
    
    func customPopIn(){
        popIn.isHidden = true
        popIn.layer.cornerRadius = 30
        popinTitle.textColor = UIColor.MainTheme.mainDarkBlue
        popinContent.textColor = UIColor.MainTheme.mainDarkBlue
        popIn.backgroundColor = UIColor(red: 163/255.0, green: 217/255.0, blue: 237/255.0, alpha: 1)

    }
    
    private func switchStoryboard() {
        let mainView: UIStoryboard = UIStoryboard(name: "Polowers", bundle: nil)
        let mainVC = mainView.instantiateViewController(identifier: "PolowersVC")
        self.show(mainVC, sender: nil)
    }
        
    var counter = 0
    var countItems = 0
    
    
    @IBAction func launchTravel(_ sender: UIButton) {
        
              self.counter += 1
                self.countItems += 1
        popIn.isHidden = false
                
                print(counter)
                
                TravelService().currentTravel(){result  in
                           
                    if let user = result {
                        

                        switch self.counter {
                        case 1..<5:
                            print(user.daysDatas[0])
                            print(user.daysDatas[0].items.count)
                            
                            print(user.daysDatas[0].items[self.countItems-1])
                           
      
                            let header:String? = user.daysDatas[0].items[self.countItems-1].value(forKey: "header") as? String

                            let localizations:Array? = user.daysDatas[0].items[self.countItems-1].value(forKey: "localization") as? Array<Any>
                            let text:String? = user.daysDatas[0].items[self.countItems-1].value(forKey: "text") as? String

                            // get localizations
                            if let localization = localizations{
                                 print(localization[0],localization[1])
                                

                                let destination = CLLocationCoordinate2D(latitude: localization[0] as! CLLocationDegrees, longitude: localization[1] as! CLLocationDegrees)

                                
                                   let annotation = MGLPointAnnotation()
                               
                              if let annotations = self.mapView.annotations {
                                                               self.mapView.removeAnnotations(annotations)
                                                              }

                                   annotation.coordinate = destination
                                   annotation.title = "Start Navigation"
                                   self.mapView.addAnnotation(annotation)
                                    
                                                       
                                   self.calculateRoute(from: (self.mapView.userLocation!.coordinate), to: destination) { (route, error) in
                                      if error != nil{
                                          print("error getting route")
                                       }
                                   }
    
                            
                                                        
                             }
                            
                            
                            
                            // get headers
                            if let head = header{
                                 print(head)
                                self.popinTitle.text? = head
                             }
                        
                            if let content = text{
                                print(content)
                               self.popinContent.text? = content
                            }
                            
                            // set countItems to 0 for the next day
                            if self.countItems == user.daysDatas[0].items.count{
                                print(" COUNTER EST EGALE A 0 MAINTENANT --------")
                                self.countItems = 0
                            }
                        case 5..<9:
                            print(user.daysDatas[1])
                            print(user.daysDatas[1].items.count)
                            
                            print(user.daysDatas[1].items[self.countItems-1])
                            
                            
                            
                            let header:String? = user.daysDatas[1].items[self.countItems-1].value(forKey: "header") as? String
                            let localizations:Array? = user.daysDatas[1].items[self.countItems-1].value(forKey: "localization") as? Array<Any>

                            let text:String? = user.daysDatas[1].items[self.countItems-1].value(forKey: "text") as? String

                              // get localizations
                              if let localization = localizations{
                                   print(localization[0],localization[1])
                                
                                let destination = CLLocationCoordinate2D(latitude: localization[0] as! CLLocationDegrees, longitude: localization[1] as! CLLocationDegrees)

                                                        
                                
                                   let annotation = MGLPointAnnotation()
                               
                              if let annotations = self.mapView.annotations {
                                                               self.mapView.removeAnnotations(annotations)
                                                              }

                                   annotation.coordinate = destination
                                   annotation.title = "Start Navigation"
                                   self.mapView.addAnnotation(annotation)
                                    
                                                       
                                   self.calculateRoute(from: (self.mapView.userLocation!.coordinate), to: destination) { (route, error) in
                                      if error != nil{
                                          print("error getting route")
                                       }
                                   }
                                
                               }
                              // get headers
                              if let head = header{
                                   print(head)
                                  self.popinTitle.text? = head
                               }
                          
                              if let content = text{
                                  print(content)
                                 self.popinContent.text? = content
                              }
                              if self.countItems == user.daysDatas[1].items.count{
                                  print(" COUNTER EST EGALE A 0 MAINTENANT ////  --------")
                                  self.countItems = 0
                              }

                        case 9..<14:
                            print(user.daysDatas[2])
                            print(user.daysDatas[2].items.count)
                            
                            let text:String? = user.daysDatas[2].items[self.countItems-1].value(forKey: "text") as? String
                            let header:String? = user.daysDatas[2].items[self.countItems-1].value(forKey: "header") as? String
                            let localizations:Array? = user.daysDatas[2].items[self.countItems-1].value(forKey: "localization") as? Array<Any>

                              // get localizations
                              if let localization = localizations{
                                   print(localization[0],localization[1])
                                                          
                                let destination = CLLocationCoordinate2D(latitude: localization[0] as! CLLocationDegrees, longitude: localization[1] as! CLLocationDegrees)

                                                                       
                                               
                                  let annotation = MGLPointAnnotation()
                              
                             if let annotations = self.mapView.annotations {
                                                              self.mapView.removeAnnotations(annotations)
                                                             }

                                  annotation.coordinate = destination
                                  annotation.title = "Start Navigation"
                                  self.mapView.addAnnotation(annotation)
                                   
                                                      
                                  self.calculateRoute(from: (self.mapView.userLocation!.coordinate), to: destination) { (route, error) in
                                     if error != nil{
                                         print("error getting route")
                                      }
                                  }
                               }
                              // get headers
                              if let head = header{
                                   print(head)
                                  self.popinTitle.text? = head
                               }
                          
                              if let content = text{
                                  print(content)
                                 self.popinContent.text? = content
                              }

                            print(user.daysDatas[2].items[self.countItems-1])
                                 if self.countItems == user.daysDatas[2].items.count{
                                     print(" COUNTER EST EGALE A 0 MAINTENANT :: --------")
                                     self.countItems = 0
                                 }
                        case 14..<18:
                            print(user.daysDatas[3])
                            print(user.daysDatas[3].items.count)

                            let text:String? = user.daysDatas[3].items[self.countItems-1].value(forKey: "text") as? String
                            let header:String? = user.daysDatas[3].items[self.countItems-1].value(forKey: "header") as? String
                            let localizations:Array? = user.daysDatas[3].items[self.countItems-1].value(forKey: "localization") as? Array<Any>

                                // get localizations
                                if let localization = localizations{
                                     print(localization[0],localization[1])
                                    
                                    let destination = CLLocationCoordinate2D(latitude: localization[0] as! CLLocationDegrees, longitude: localization[1] as! CLLocationDegrees)

                                                                           
                                                   
                                      let annotation = MGLPointAnnotation()
                                  
                                 if let annotations = self.mapView.annotations {
                                                                  self.mapView.removeAnnotations(annotations)
                                                                 }

                                      annotation.coordinate = destination
                                      annotation.title = "Start Navigation"
                                      self.mapView.addAnnotation(annotation)
                                       
                                                          
                                      self.calculateRoute(from: (self.mapView.userLocation!.coordinate), to: destination) { (route, error) in
                                         if error != nil{
                                             print("error getting route")
                                          }
                                      }
                                                            
                                 }
                                // get headers
                                if let head = header{
                                     print(head)
                                    self.popinTitle.text? = head
                                 }
                            
                                if let content = text{
                                    print(content)
                                   self.popinContent.text? = content
                                }
                            
                            print(user.daysDatas[3].items[self.countItems-1])
                                 if self.countItems == user.daysDatas[3].items.count{
                                     print("COUNTER EST EGALE A 0 MAINTENANT ! --------")
                                     self.countItems = 0
                                 }
                        case 18:
                            
                                self.popIn.isHidden = true
                                self.present(Alert.alert, animated: true)

                                Alert.title?.text = "Votre voyage est terminé !"
                                Alert.body?.text = "Partagez vos meilleurs souvenirs !"
                                Alert.button?.setTitle("Communauté Polowers", for: .normal)
                                Alert.alert.ratingStackView.isHidden = true
                                Alert.alert.actionButton.addTarget(self, action: #selector(self.display), for: .touchUpInside)

                        default:
                           break
                        }
           
                    }
                }
                        
    }
       
    @objc func display(_sender: BasicButton){
        Alert.alert.view.isHidden = true
        switchStoryboard()
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
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
    // Substitute our custom view for the user location annotation. This custom view is defined below.
        if annotation is MGLUserLocation && mapView.userLocation != nil {
            return CustomUserLocationAnnotationView()
        }
        return nil
    }

}

