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
    
    @Published var location: MKCoordinateRegion
    
    init(item: CountryResponseModelElement?) {
        self.item = item
        self.location = MKCoordinateRegion(center:
                                            CLLocationCoordinate2D(latitude:  item?.capitalInfo?.latlng?.first ?? 0,
                                                                   longitude:  item?.capitalInfo?.latlng?.last ?? 0),
                                           span: MKCoordinateSpan(latitudeDelta: 9, longitudeDelta: 9))
    }
    
    
    var flagURL : URL? {
        guard let flagURL = item?.flags?.png else { return nil }
        return URL(string:flagURL)
    }
    
    var commonName : String {
        return item?.name?.common ?? missingDataText
    }
    
    var officialName : String {
        return "Official Name: " + (item?.name?.official ?? missingDataText)
    }
    
    var capital : String {
        return "Capital: " + (item?.capital?.first ?? missingDataText)
    }
    
    var region : String {
        return "Region: " + (item?.region ?? missingDataText)
    }
    
    var area : String {
        guard let area = StringUtilities.convertIntToFormattedString(intValue: item?.area) else {
            return "Area: " + missingDataText
        }
        return "Area: " + area
    }
    
    var population : String {
        guard let population = StringUtilities.convertIntToFormattedString(intValue: item?.population) else {
            return "Population: " + missingDataText
        }
        return "Population: " + population
    }
    
    
}
