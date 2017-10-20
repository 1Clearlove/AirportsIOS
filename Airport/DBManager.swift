//
//  DBManager.swift
//  Airport
//
//  Created by Mathieu Knook on 20/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class DBManager: NSObject {
    
    let field_icao = "icao"
    let field_name = "name"
    let field_longitude = "longitude"
    let field_latitude = "latitude"
    let field_elevation = "elevation"
    let field_iso_country = "iso_country"
    let field_municipality = "municipality"
    
    let path = Bundle.main.path(forResource: "airports", ofType: "sqlite")
    
    static let shared: DBManager = DBManager()
    
    var database: FMDatabase!
    
    override init() {
        super.init()
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            database = FMDatabase(path: path)
        }
        
        if database.open() {
            return true
        }
        
        return false
    }
    
    func getAllAirports() -> [Airport]! {
        var airports = [Airport]()
        
        if openDatabase() {
            let query = "SELECT * FROM airports WHERE name != '' ORDER BY name ASC"
            
            do {
                print(database)
                let results = try database.executeQuery(query, values: nil)
                
                while results.next() {
                    let airport = Airport(icao: results.string(forColumn: field_icao)!,
                                          name: results.string(forColumn: field_name)!,
                                          longitude: results.string(forColumn: field_longitude)!,
                                          latitude: results.string(forColumn: field_latitude)!,
                                          elevation: Double(results.double(forColumn: field_elevation)),
                                          iso_country: results.string(forColumn: field_iso_country)!,
                                          municipality: results.string(forColumn: field_municipality)!
                    )
                    
                    airports.append(airport)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
            database.close()
        }
        
        return airports
    }
}
