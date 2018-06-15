//
//  VCMapViewController.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 19/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet
    var myMap:MKMapView?
    
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        myMap?.showsUserLocation = true
        agregarPin(nombre: "Test Pin", lat: 42 , lon: -3 )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mySpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        print("----->>>>>",locations[0])
        let tempRegion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: mySpan)
        //myMap?.setRegion(tempRegion, animated: true)
    }
    
    func agregarPin(nombre:String, lat:Double, lon:Double){
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate.latitude = lat
        annotation.coordinate.longitude = lon
        annotation.title = nombre
        myMap?.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
