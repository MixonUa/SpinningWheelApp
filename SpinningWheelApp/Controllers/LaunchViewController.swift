//
//  LaunchViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.presentVC()
        }

    }
    

    // MARK: - Navigation
    private func presentVC() {
        let nextVC = MainViewController()
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
