//
//  APICaller.swift
//  Rick&MortyApi
//
//  Created by Ömer Faruk Kılıçaslan on 11.07.2022.
//

import UIKit

struct RickMorty: Codable {
    
    let results: [Characters]
    
}

struct Characters: Codable {
    
    let name: String?
    let status: String?
    let image: String?
    let gender: String?
    
}
