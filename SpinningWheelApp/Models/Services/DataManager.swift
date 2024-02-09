//
//  DataManager.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 09.02.2024.
//

import Foundation

class DataManager {
    private let fetchedDataProvider: NetworkFetchService
    public var emodjiData = [EmodjiDataModel]()
    public var recievedError = String()
    
    init(fetchedDataProvider: NetworkFetchService = NetworkFetchService()) {
        self.fetchedDataProvider = fetchedDataProvider
    }
    
    public func getData() {
        fetchedDataProvider.requestEmodjis { [self] result in
            switch result {
            case .success(let data): emodjiData = data
            case .failure(let error): recievedError = error.localizedDescription
            }
        }
    }
    
    public func getSortedTitlesSet(from data: [EmodjiDataModel]) -> Set<String> {
        var titlesSet = Set<String>()
        data.forEach { (element) in
            titlesSet.insert(element.category)
        }
        return titlesSet
    }
    
    public func sortEmodji(from data: [EmodjiDataModel], by category: Set<String>) -> [String:[String]] {
        var sortedEmodjis: [String:[String]] = [:]
        var arrayOfEmodjis = [String]()
        for title in category {
            data.forEach { (element) in
                if element.category == title {
                    arrayOfEmodjis.append(element.emoji)
                } else { return }
            }
            sortedEmodjis[title] = arrayOfEmodjis
            arrayOfEmodjis.removeAll()
        }
        return sortedEmodjis
    }
}
