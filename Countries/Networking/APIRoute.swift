//
//  APIRoute.swift
//  Countries
//
//  Created by Emin on 10.12.2022.
//

import Foundation

enum APIRoute {
    case getAllCountries
    case querryCountryByName(name:String)

    private var baseURLString: String { "https://restcountries.com/v3.1/" }

    private var url: URL? {
        switch self {
            
        case .getAllCountries:
            return URL(string: baseURLString + "all")
        case .querryCountryByName(name: let name):
            return URL(string: baseURLString + "name/" + name)
        }
    }

    private var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }

    func asRequest() -> URLRequest? {
        guard let url = url else {
            print("Missing URL for route: \(self)")
            return nil
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters

        guard let parametrizedURL = components?.url else {
            print("Missing URL with parameters for url: \(url)")
            return nil
        }

        return URLRequest(url: parametrizedURL)
    }
}
