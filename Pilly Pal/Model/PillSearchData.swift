//
//  PillSearchData.swift
//  Pilly Pal
//
//  Created by ΛZ on 8/14/21.
//

import Foundation

struct PillSearchData: Codable {
    
    let nlmRxImages: [nlmRxImages]
    
}

struct nlmRxImages: Codable {
    
    let name: String
    let imageUrl: String
    
}
