//
//  DataManager.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 09.02.2024.
//

import Foundation

class DataManager {
    private var titlesSet = Set<String>()
    private var sortedEmodjis: [String:[String]] = [:]
    
    public func prepareViewModels(from data: [EmodjiDataModel]) -> [GameChoiceButtonViewModel] {
        var viewModels = [GameChoiceButtonViewModel]()
        getSortedTitlesSet(from: data)
        sortEmodji(from: data, by: titlesSet)
        for title in titlesSet {
            guard let emodjis = sortedEmodjis[title] else { break }
            viewModels.append(GameChoiceButtonViewModel(tittle: title, emodji: (emodjis[0]), emodjiSet: emodjis))
        }
        return viewModels
    }
    
    private func getSortedTitlesSet(from data: [EmodjiDataModel]) {
        data.forEach { (element) in
            titlesSet.insert(element.category)
        }
    }
    
    private func sortEmodji(from data: [EmodjiDataModel], by category: Set<String>) {
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
    }
}
