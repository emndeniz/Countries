//
//  CountriesListViewModel.swift
//  CountriesApp
//
//  Created by Emin on 5.12.2022.
//

import Foundation

class ViewModel {
    
    var model : Model?

    
    init() {
        
    }
    
    func getAPIData() {
        let serviceProvider: ServiceProvider<QuerryCountriesServices> = ServiceProvider<QuerryCountriesServices>()
        
        serviceProvider.request(service: .name(name: "Turkey"), decodeType: CountryResponseModel.self) { result in
            switch result {
                
            case .success(let data):
                self.setModel(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func setModel(data:CountryResponseModel){
        guard let data = data.first else {
            print("Failed to parse data")
            return
        }
        
        let commonName = data.name?.common ?? "Name not provided"
        let officalName = "Official Name: " + (data.name?.official ?? "not provided")
        let currency = "Currency: " + (data.currencies?.tl?.name ?? "not provided")
        let capital = "Capital: " + (data.capital?.first ?? "not provided")
        let language = "Language: " + (data.languages?.tur ?? "not provided")
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        var area = "Area not provided"
        if let areaInt = data.area,
            let formatted = numberFormatter.string(from: NSNumber(value: areaInt))  {
            area = "Area: " + formatted
        }
        var population = "Population not provided"
        if let populationInt = data.population,
            let formatted = numberFormatter.string(from: NSNumber(value: populationInt)) {
            population = "Population: " + formatted
        }
        
        var longLat: Model.LatLong?
        
        if let lonVal = data.capitalInfo?.latlng?.last,
           let latVal = data.capitalInfo?.latlng?.first {
            longLat = Model.LatLong(lat: latVal, long: lonVal)
        }
        
        // Set new model
        model = Model(flagImage: data.flags?.png,
                      commanName: commonName,
                      officalName: officalName,
                      currency:  currency,
                      capital: capital,
                      language:  language,
                      area: area ,
                      population: population,
                      mapView: longLat)
        
        
    }
    
}



struct Model {
    let flagImage: String?
    let commanName: String
    let officalName: String
    let currency: String
    let capital:String
    let language: String
    let area: String
    let population: String
    let mapView: LatLong?
    
    struct LatLong {
        let lat: Double
        let long: Double
    }
}
