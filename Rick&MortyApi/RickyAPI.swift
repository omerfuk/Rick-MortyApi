//
//  RickyAPI.swift
//  Rick&MortyApi
//
//  Created by Ömer Faruk Kılıçaslan on 11.07.2022.
//

import Foundation


final class RickyAPI {
    
    static let shared = RickyAPI()
    
    
    
    func getAPIData(onCompletion: @escaping ([Characters]) -> ()) {
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
           
                guard let characterList = try? JSONDecoder().decode(RickMorty.self, from: data) else{return}
                
            onCompletion(characterList.results)
//                print(characterList.results)
                
  
            
        } .resume()
        
    }
    
}
