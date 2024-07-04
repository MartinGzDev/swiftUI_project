//
//  ApiNetwork.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 04/07/2024.
//

import Foundation


class ApiNetwork {
    
    struct Wrapper: Codable{
        let response: String
        let results:[SuperHero]
    }
    
    struct SuperHero: Codable, Identifiable{
        let id: String
        let name: String
        let image: ImageHero
    }
    
    struct ImageHero:Codable{
        let url: String
    }
    
    struct superheroCompleted:Codable{
        let id: String
        let name: String
        let image: ImageHero
        let powerstats: PowerStats
        let biography: Biography
    }
    
    struct PowerStats: Codable{
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable{
        let alignment: String
        let publisher: String
        let aliases: [String]
        let fullName: String
        
        enum CodingKeys: String, CodingKey{
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/65017b37c52b7662bcba6b0474ada4b9/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Wrapper.self, from: data)
    }
    
    func getHeroById(id:String) async throws -> superheroCompleted {
        let url = URL(string: "https://superheroapi.com/api/65017b37c52b7662bcba6b0474ada4b9/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(superheroCompleted.self, from: data)
    }
}
