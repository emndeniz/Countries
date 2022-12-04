//
//  QuerryCountriesService.swift
//  CountriesApp
//
//  Created by Emin on 16.09.2022.
//

import Foundation


/// This enum handles All Countries request to Countries API.
enum QuerryCountriesServices {
    case name(name:String)
    case currency(currency:String)
    case capital(capitalName:String)
}


extension QuerryCountriesServices: ServiceBase {
    var path: String {
        
        switch self {
        case .name(let name):
            return "/v3.1/name/" + name
        case .currency(currency: let currency):
            return "/v3.1/currency/" + currency
        case .capital(capitalName: let capitalName):
            return "/v3.1/capital/" + capitalName
        }
    }
    
    var parameters: [String : Any]? {
        // Parameters in these requests should be empty, because the don't require any param.
        return [:]
    }
    
    var method: ServiceMethod {
        return .get
    }
}
