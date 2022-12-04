//
//  CountryResponseModel.swift
//  CountriesApp
//
//  Created by Emin on 16.09.2022.
//
import Foundation

// MARK: - CountryResponseModelElement
struct CountryResponseModelElement: Codable {
    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies: Currency?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region, subregion: String?
    let languages: Languages?
    let translations: [String: Translation]?
    let latlng: [Int]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Int?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: Gini?
    let car: Car?
    let timezones, continents: [String]?
    let flags, coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: String?
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

// MARK: - Currencies
struct Currency: Codable {
    let gbp: Gbp?
    let tl: Gbp?
    enum CodingKeys: String, CodingKey {
        case gbp = "GBP"
        case tl = "TRY"
    }
}

// MARK: - Gbp
struct Gbp: Codable {
    let name, symbol: String?
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng, fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String?
}

// MARK: - Gini
struct Gini: Codable {
    let the2017: Double?

    enum CodingKeys: String, CodingKey {
        case the2017 = "2017"
    }
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Languages
struct Languages: Codable {
    let eng: String?
    let tur: String?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
    let nativeName: NativeName?
}

// MARK: - NativeName
struct NativeName: Codable {
    let eng: Translation?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String?
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format, regex: String?
}

typealias CountryResponseModel = [CountryResponseModelElement]
