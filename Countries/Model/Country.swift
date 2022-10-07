//
//  Country.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import Foundation

struct Countries : Decodable {
    let data : [Country]
}

struct Country: Decodable {
    let code : String?
    let currencyCodes : [String]?
    let name : String?
    let wikiDataId : String?
}
