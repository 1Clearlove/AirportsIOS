import UIKit
import MapKit

class Airport: NSObject {
    var icao: String?
    var name: String?
    var longitude: String?
    var latitude: String?
    var elevation: Double?
    var iso_country: String?
    var municipality: String?
    
    init(icao: String?, name: String?, longitude: String?, latitude: String?, elevation: Double?, iso_country: String?, municipality: String?) {
        self.icao = icao
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.elevation = elevation
        self.iso_country = iso_country
        self.municipality = municipality
    }
}
