//
//  NetworkManager.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/13/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // Creates singleton
    static let shared = NetworkManager()
    private init(){}
    


    let baseURL = "http://127.0.0.1:5000/auth"

    
    func getToken(userData: Data , completed: @escaping(Result<String, ErrorMessage>) -> Void){

        let endpoint = baseURL + "/login"

        // Returns if URL is invalid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.uploadTask(with: request, from: userData) { data, response, error in
            // Returns if error exists
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            // Returns if response is not successful status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }

            // Returns if data is invalid
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            // Tries to decode data, throws failure if invalid

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MLHAuth.self, from: data)
                let token = response.token

                completed(.success(token))

            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }

}
