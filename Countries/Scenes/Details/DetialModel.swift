//
//  DetialModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation
import MapKit

struct DetailModel {
    
    private let item:AllCountriesResponseModelElement?

    
    var flagURL : URL? {
        return URL(string:"")
    }
    
    var commonName : String {
        return ""
    }
    
    var officialName : String {
        return "Official Name:"
    }
    
    var capital : String {
        return "Capital: "
    }
    
    var region : String {
        return "Region: "
    }
    
    var area : String {
        return String(format: "%.1f", "123456")
    }
    
    var population : String {
        return String(format: "%.1f", "123456")
    }
    
    var location: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.87, longitude: 2.33),
                           span: MKCoordinateSpan(latitudeDelta: 9, longitudeDelta: 9))
    }
}
