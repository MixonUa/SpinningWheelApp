//
//  LaunchViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class LaunchViewController: UIViewController {
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    let fetchedDataProvider = NetworkFetchService()
    private var data = [EmodjiDataModel]()
    let storage = UserDefaults.standard
    var error: Error? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoadingIndicator()
        loadingIndicator.startAnimating()
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
            case .failure(let recievedError): self?.error = recievedError; self?.showAlert(title: "ERROR", message: recievedError.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { [self] in
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
            if error == nil {
            presentVC()
            }
        }
    }
    
    // MARK: - ViewConfiguration
    private func configureLoadingIndicator() {
        loadingIndicator.style = .large
        loadingIndicator.color = UIColor.lightGray
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 80),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 80)
        ])
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
