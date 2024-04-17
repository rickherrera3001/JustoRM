//
//  ApiClient.swift
//  Justo RM
//
//  Created by Ricardo Developer on 17/04/24.
//

import Foundation

class ApiClient {
    
    func getData(completion: @escaping (Result<JustoRM, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            
            do {
                let result = try JSONDecoder().decode(JustoRM.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }
        task.resume()
            
        }
}




