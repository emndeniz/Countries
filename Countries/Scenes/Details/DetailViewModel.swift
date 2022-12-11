//
//  CountriesDetailViewModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject  {
    
    @Published var dataSource: [DetailModel] = []
    let countryName: String
    
    private var requestHandler : RequestHandling
    
    init(countryName : String,
         requestHandler:RequestHandling = RequestHandler()) {
        self.countryName = countryName
        self.requestHandler = requestHandler
    }
    
    func getAPIData(){
        requestHandler.request(service: .querryCountryByName(name: countryName)) { [weak self]
            (result : Result<CountryResponseModel,APIError>) in
            switch result {
            case .success(let response):
                self?.setData(response: response)
            case .failure(let failure):
                print("Fail \(failure)")
            }
        }
    }
    
    private func setData(response:CountryResponseModel){
        guard let data = response.first else {
            print("Failed to get first data")
            return
        }
        
        dataSource = [DetailModel(item: data)]
    }
}
