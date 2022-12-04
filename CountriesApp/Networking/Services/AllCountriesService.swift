//
//  AllCountriesService.swift
//  CountriesApp
//
//  Created by Emin on 16.09.2022.
//

import Foundation

/// This enum handles All Countries request to Countries API.
enum AllCountriesServices {
    case all
}


extension AllCountriesServices: ServiceBase {
    var path: String {
        
        switch self {
        case .all:
            return "/v3.1/all"
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
