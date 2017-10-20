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
    var selectedAirport: Airport?
    var distance: Double?
    
    @IBOutlet weak var map: MKMapView!
    var coordinateArray = [CLLocationCoordinate2D]()
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var LattLabel: UILabel!
    @IBOutlet weak var LongLabel: UILabel!
    @IBOutlet weak var DistanceTextLabel: UILabel!
    @IBOutlet weak var DistanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map.delegate = self
        drawLine()
        setValues()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawLine(){
        let endLat = Double((selectedAirport?.latitude)!)
        let endLong = Double((selectedAirport?.longitude)!)
        
        let startCoordinate = CLLocation(latitude: 52.3105, longitude: 4.7683 )
        let endCoordinate = CLLocation(latitude: endLat!, longitude: endLong!)
        
        var array = [startCoordinate.coordinate, endCoordinate.coordinate]
        // let polyline = MKPolyline(coordinates: array , count: 2)
        let geoline = MKGeodesicPolyline(coordinates: array, count: 2)
        
        self.distance = startCoordinate.distance(from: endCoordinate)
        
        map.add(geoline)
    }
    
    func setValues(){
        self.DistanceTextLabel.text = "afstand "
        self.NameLabel.text = selectedAirport?.name
        self.LattLabel.text = selectedAirport?.latitude
        self.LongLabel.text = selectedAirport?.longitude
        self.DistanceLabel.text = "\(distance!)"
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
