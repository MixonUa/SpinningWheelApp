//
//  NetworkManager.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 09.02.2024.
//

import Foundation

class NetworkManager {
    func requestData(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                completion(data, nil)
            }
        }.resume()
    }
}
