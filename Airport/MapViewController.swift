//
//  MapViewController.swift
//  Airport
//
//  Created by Ferdinand van Disseldorp on 20/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var coordinateArray = [CLLocationCoordinate2D]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map.delegate = self
        drawLine()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawLine(){
        
        let startCoordinate = CLLocation(latitude: 51.5719, longitude: 4.7683)
        let endCoordinate = CLLocation(latitude: -43.5320, longitude: 172.6362)
        
        var array = [startCoordinate.coordinate, endCoordinate.coordinate]
        
        // let polyline = MKPolyline(coordinates: array , count: 2)
        let geoline = MKGeodesicPolyline(coordinates: array, count: 2)
        
        
        map.add(geoline)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 3.0
        renderer.alpha = 0.5
        renderer.strokeColor = UIColor.blue
        
        return renderer
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
