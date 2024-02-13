//
//  LaunchViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class LaunchViewController: UIViewController {
    let fetchedDataProvider = NetworkFetchService()
    private var data = [EmodjiDataModel]()
    let storage = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if storage.integer(forKey: "score") == 0 {
        storage.setValue(500, forKey: "score")
            print("SET SCORE 500")
        }
        
        let group = DispatchGroup()
        group.enter()
        fetchedDataProvider.requestEmodjis { [weak self] result in
            switch result {
            case .success(let recievedData): self?.data = recievedData
            case .failure(let recievedError): self?.showAlert(title: "ERROR", message: recievedError.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.presentVC()
        }
    }
    

    // MARK: - Navigation
    private func presentVC() {
        let nextVC = MainViewController()
        nextVC.emodjiData = data
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
