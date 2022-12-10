//
//  CountriesDetailViewModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject  {
    
    @Published var dataSource: DetailModel?
    let countryName: String
    
    private var requestHandler : RequestHandling
    
    init(countryName : String,
         dataSource: DetailModel? = nil,
         requestHandler:RequestHandling = RequestHandler()) {
        self.countryName = countryName
        self.dataSource = dataSource
        self.requestHandler = requestHandler
    }
    
}
