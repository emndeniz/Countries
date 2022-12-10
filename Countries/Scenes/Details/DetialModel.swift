//
//  DetialModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation
import MapKit


class DetailModel {
    
    private let item:CountryResponseModelElement?

    private let missingDataText = "Data missing"

    private let numberFormatter = NumberFormatter()
    @Published var location: MKCoordinateRegion
    
    init(item: CountryResponseModelElement?) {
            self.item = item
            numberFormatter.numberStyle = .decimal
            self.location = MKCoordinateRegion(center:
                                                CLLocationCoordinate2D(latitude:  item?.capitalInfo?.latlng?.first ?? 0,
                                                                       longitude:  item?.capitalInfo?.latlng?.last ?? 0),
                                               span: MKCoordinateSpan(latitudeDelta: 9, longitudeDelta: 9))
    }
    
    
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
    
}
