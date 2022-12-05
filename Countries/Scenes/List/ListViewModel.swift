//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var dataSource = ListModel()

    private var requestHandler : RequestHandling
    init(requestHandler:RequestHandling = RequestHandler() ) {
        self.requestHandler = requestHandler
    }
  
}

