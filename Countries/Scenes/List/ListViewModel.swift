//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var dataSource : [CellViewModel] = []

    private var requestHandler : RequestHandling
    init(requestHandler:RequestHandling = RequestHandler() ) {
        self.requestHandler = requestHandler
    }
  
    func getAPIData(){
        requestHandler.request(service: AllCountriesService.all) { [weak self] (result : Result<AllCountriesResponseModel, APIError>) in
            
            switch result {
                
            case .success(let response):
                self?.setCellData(allCountries: response)
            case .failure(_):
                print("Show error")
            }
        }
    }
    
    private func setCellData(allCountries:AllCountriesResponseModel) {
        var tempDataSource : [CellViewModel] = []
        for contry in allCountries {
            let cellModel = CellViewModel(item: contry)
            tempDataSource.append(cellModel)
        }
        
        dataSource = tempDataSource
    }
    
    
}

