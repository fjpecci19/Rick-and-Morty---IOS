//
//  Character.swift
//  Rick and Morty
//
//  Created by Franco Pecci on 2023-08-23.
//

import Foundation

// {
//"results":
//  [
//   {
//      "id":1,
//      "name":"Rick Sanchez",
//      "status":"Alive",
//      "species":"Human",
//      "image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg"
//   }
//  ]
// }

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String

}

struct CharacterListResponse: Codable {
    let results: [Character]
}
