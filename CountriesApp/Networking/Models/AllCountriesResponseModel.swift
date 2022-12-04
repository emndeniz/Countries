//
//  AllCountriesResponseModel.swift
//  CountriesApp
//
//  Created by Emin on 16.09.2022.
//

import Foundation

// MARK: - AllCountriesResponseModelElement
struct AllCountriesResponseModelElement: Codable {
    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: Status?
    let unMember: Bool?
    let currencies: Currencies?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: [String: Double]?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [Continent]?
    let flags, coatOfArms: CoatOfArms?
    let startOfWeek: StartOfWeek?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let eur, gtq, clp, uyu: Aed?
    let kgs, zmw, nzd, gel: Aed?
    let ttd, krw, usd, xof: Aed?
    let mkd, fjd, mga, xcd: Aed?
    let aud, crc, dzd, nio: Aed?
    let zwl, rwf, currenciesTRY, tjs: Aed?
    let jmd, gbp, shp, awg: Aed?
    let pkr, byn, sbd, szl: Aed?
    let zar, xpf, mxn, ggp: Aed?
    let chf, bwp, ils, gnf: Aed?
    let kpw, php, tnd, xaf: Aed?
    let ngn, jep, egp, jod: Aed?
    let kmf, lsl, idr, cad: Aed?
    let amd, fkp, pab, lak: Aed?
    let azn, khr, cuc, cup: Aed?
    let stn, rsd, vnd, lkr: Aed?
    let mad, mru, qar, sll: Aed?
    let isk, gmd, gyd, ang: Aed?
    let sek, tvd, aed, ves: Aed?
    let wst, lbp, top, imp: Aed?
    let bam: BAM?
    let htg, scr, tzs, dkk: Aed?
    let fok, ern, etb, mnt: Aed?
    let npr, syp, bnd, sgd: Aed?
    let ssp, iqd, all, ugx: Aed?
    let btn, inr, nad, omr: Aed?
    let bdt, djf, twd, mur: Aed?
    let nok, thb, hnl, pyg: Aed?
    let lrd, sos, gip, bsd: Aed?
    let mwk, sar, lyd, bob: Aed?
    let pgk, bbd, bgn: Aed?
    let sdg: BAM?
    let tmt, mmk, brl, cop: Aed?
    let irr, mdl, mop, cve: Aed?
    let jpy, bhd, ckd, mvr: Aed?
    let dop, cdf, yer, uah: Aed?
    let cny, pen, srd, afn: Aed?
    let huf, kwd, kyd, myr: Aed?
    let ghs, hrk, czk, uzs: Aed?
    let bif, bzd, kes, kzt: Aed?
    let ars, hkd, ron, kid: Aed?
    let vuv, aoa, pln, mzn: Aed?
    let bmd, rub: Aed?

    enum CodingKeys: String, CodingKey {
        case eur
        case gtq
        case clp
        case uyu
        case kgs
        case zmw
        case nzd
        case gel
        case ttd
        case krw
        case usd
        case xof
        case mkd
        case fjd
        case mga
        case xcd
        case aud
        case crc
        case dzd
        case nio
        case zwl
        case rwf
        case currenciesTRY
        case tjs
        case jmd
        case gbp
        case shp
        case awg
        case pkr
        case byn
        case sbd
        case szl
        case zar
        case xpf
        case mxn
        case ggp
        case chf
        case bwp
        case ils
        case gnf
        case kpw
        case php
        case tnd
        case xaf
        case ngn
        case jep
        case egp
        case jod
        case kmf
        case lsl
        case idr
        case cad
        case amd
        case fkp
        case pab
        case lak
        case azn
        case khr
        case cuc
        case cup
        case stn
        case rsd
        case vnd
        case lkr
        case mad
        case mru
        case qar
        case sll
        case isk
        case gmd
        case gyd
        case ang
        case sek
        case tvd
        case aed
        case ves
        case wst
        case lbp
        case top
        case imp
        case bam
        case htg
        case scr
        case tzs
        case dkk
        case fok
        case ern
        case etb
        case mnt
        case npr
        case syp
        case bnd
        case sgd
        case ssp
        case iqd
        case all
        case ugx
        case btn
        case inr
        case nad
        case omr
        case bdt
        case djf
        case twd
        case mur
        case nok
        case thb
        case hnl
        case pyg
        case lrd
        case sos
        case gip
        case bsd
        case mwk
        case sar
        case lyd
        case bob
        case pgk
        case bbd
        case bgn
        case sdg
        case tmt
        case mmk
        case brl
        case cop
        case irr
        case mdl
        case mop
        case cve
        case jpy
        case bhd
        case ckd
        case mvr
        case dop
        case cdf
        case yer
        case uah
        case cny
        case pen
        case srd
        case afn
        case huf
        case kwd
        case kyd
        case myr
        case ghs
        case hrk
        case czk
        case uzs
        case bif
        case bzd
        case kes
        case kzt
        case ars
        case hkd
        case ron
        case kid
        case vuv
        case aoa
        case pln
        case mzn
        case bmd
        case rub
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String?
}

// MARK: - BAM
struct BAM: Codable {
    let name: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case sunday = "sunday"
    case turday = "turday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

typealias AllCountriesResponseModel = [AllCountriesResponseModelElement]
