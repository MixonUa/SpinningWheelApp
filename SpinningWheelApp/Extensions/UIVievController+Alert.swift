//
//  UIVievController+Alert.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 12.02.2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Exit", style: .default) { (_) in
            exit(0)
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
