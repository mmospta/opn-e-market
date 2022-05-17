//
//  NetworkManager.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//

import Foundation

enum APIError: Error {
    case invalidData
    case invalidURL
    case unableToComplete
    case invalidResponse
}

class NetworkManager {
    func fetchStore(completion: @escaping (Result<Store, APIError>) -> Void) {
        guard let url = URL(string: "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/storeInfo") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ =  error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Store.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func postOrder(order: Order, completion: @escaping (Result<Void, APIError>) -> Void) {
        guard let url = URL(string: "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/order") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let jsonData = try? JSONEncoder().encode(order)
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let _ = data,
                let response = response as? HTTPURLResponse,
                error == nil
            else {
                print("error", error ?? URLError(.badServerResponse))
                completion(.failure(.unableToComplete))
                return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                completion(.failure(.invalidResponse))
                return
            }
            completion(.success(()))
        }
        task.resume()
    }
    
}
