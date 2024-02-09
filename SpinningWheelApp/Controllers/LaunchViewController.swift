//
//  LaunchViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class LaunchViewController: UIViewController {
    let fetchedDataProvider = NetworkFetchService()
    var data = [EmodjiDataModel]()
    var error: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let group = DispatchGroup()
        group.enter()
        fetchedDataProvider.requestEmodjis { [self] result in
            switch result {
            case .success(let recievedData): data = recievedData
            case .failure(let recievedError): error = recievedError.localizedDescription
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
        nextVC.error = error
        nextVC.emodjiData = data
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
