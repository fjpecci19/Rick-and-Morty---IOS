//
//  ApiProvider.swift
//  Rick and Morty
//
//  Created by Franco Pecci on 2023-08-23.
//

import Foundation
import Alamofire

final class ApiProvider {
    
    static let shared = ApiProvider()
    
    private let baseURL = "https://rickandmortyapi.com/api"
    private let ok = 200...299
    
    func getAllCharacters(completion: @escaping ([Character]) -> Void) {
        let url = "\(baseURL)/character"
        
        AF.request(url, method: .get).validate(statusCode: ok).responseDecodable(of: CharacterListResponse.self) {
            response in
            
            switch response.result {
                case .success(let characterListResponse):
                    let characters = characterListResponse.results
                    completion(characters)
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
}
