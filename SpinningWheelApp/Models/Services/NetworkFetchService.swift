//
//  NetworkFetchService.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 09.02.2024.
//

import Foundation

class NetworkFetchService {
    private let networkDataProvider: NetworkManager
    
    init(networkDataProvider: NetworkManager = NetworkManager()) {
        self.networkDataProvider = networkDataProvider
    }
    
    func requestAllNews(completion: @escaping (Result<[EmodjiDataModel], Error>) -> Void) {
        let newsURL = "https://raw.githubusercontent.com/MixonUa/JSON-Emodji/main/emoji.json"
        networkDataProvider.requestData(urlString: newsURL) { (data, error) in
            if let cathedError = error {
                if let err = cathedError as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                    completion(.failure(NetworkError.noConnection)); return
                } else {
                    completion(.failure(NetworkError.serverError(error: cathedError))); return }
                }
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode([EmodjiDataModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(answer))
                    }
                } catch let decodingError {
                    DispatchQueue.main.async {
                        completion(.failure(decodingError))
                    }
                }
            }
        }
    }
}
