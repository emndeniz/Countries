//
//  CellViewModel.swift
//  Countries
//
//  Created by Emin on 10.12.2022.
//

import Foundation


struct CellModel: Identifiable{
    var id: String = UUID().uuidString
    
    private let item:AllCountriesResponseModelElement?
    

    init(item: AllCountriesResponseModelElement?) {
        self.item = item
    }
    
    
    var imageURL: URL? {
        
        guard let urlStr = item?.flags?.png else {
            return nil
        }
        return URL(string: urlStr)
    }
    
    var name: String {
        return item?.name?.common ?? "Not Provided"
    }

}
