//
//  SearchData.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/27/21.
//

import Foundation

struct SearchData: Codable {
    
    let results: [Results]
    
}

struct Results: Codable {
    
    let openfda: Openfda
    
}

struct Openfda: Codable {
    
    let brand_name: [String]
    let generic_name: [String]
    let manufacturer_name: [String]
    let product_type: [String]
    let route: [String]
    
}
