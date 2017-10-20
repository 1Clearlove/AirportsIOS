//
//  AirportsTableViewController.swift
//  Airport
//
//  Created by Mathieu Knook on 19/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class AirportsTableViewController: UITableViewController {
    
    @IBOutlet var tabelAirport: UITableView!
    
    var airports = [Airport]()
    var airportSets = [(key: Character, value: [Airport])]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAirports();
    }
    
    func getAirports() {
        airports = DBManager.shared.getAllAirports()
        
        airports.forEach {
            airport in
            
            var tempHeader: Character = "A"
            
            if airport.name?.isEmpty == false {
                tempHeader = (airport.name?.characters.first)!
            }
            
            if airportSets.contains(where:{$0.0 == tempHeader}) {
                airportSets[airportSets.index(where: {$0.0 == tempHeader})!].value.append(airport)
            } else {
                airportSets.append((tempHeader, [airport]))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return airportSets.map {String($0.key)}
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return airportSets.index(where: {$0.key == title.characters.first!})!
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return airportSets.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(airportSets[section].key)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportSets[section].value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportTableViewCell", for: indexPath) as! AirportTableViewCell
        
        let airport = airports[indexPath.row]

        cell.nameLabel.text = airport.name
        cell.locationLabel.text = airport.municipality

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in the segue")
        if(segue.identifier=="showMap"){
            if let destination = segue.destination as? MapViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let selectedAirport = airports[indexPath.row]
                    destination.selectedAirport = selectedAirport
                }
            }
        }
    }

}
