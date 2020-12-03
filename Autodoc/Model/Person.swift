//
//  Person.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import Foundation

struct Person: Decodable {
    var IdClient: Int
    var IdClientAccount: Int
    var ClientCode: String
    var Latitude: Double
    var Longitude: Double
    var AvatarHash: String?
    var StatusOnline: Bool
    
    enum CodingKeys: String, CodingKey {
        case IdClient
        case IdClientAccount
        case ClientCode
        case Latitude
        case Longitude
        case AvatarHash
        case StatusOnline
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.IdClient = try container.decode(Int.self, forKey: .IdClient)
        self.IdClientAccount = try container.decode(Int.self, forKey: .IdClientAccount)
        self.ClientCode = try container.decode(String.self, forKey: .ClientCode)
        self.Latitude = try container.decode(Double.self, forKey: .Latitude)
        self.Longitude = try container.decode(Double.self, forKey: .Longitude)
        self.AvatarHash = try container.decode(String?.self, forKey: .AvatarHash)
        self.StatusOnline = try container.decode(Bool.self, forKey: .StatusOnline)
    }
}
