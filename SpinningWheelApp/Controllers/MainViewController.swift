//
//  MainViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel = GameChoiceButtonViewModel(tittle: "Countriesesese", emodji: "😀")
    var buttonsArray:[GameChoiceButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let firstButton = GameChoiceButton(with: viewModel)
        buttonsArray.append(firstButton)
        let secondButton = GameChoiceButton(with: GameChoiceButtonViewModel(tittle: "Countriesesese wowowowowo", emodji: "🦃"))
        buttonsArray.append(secondButton)
        configureButtons(with: buttonsArray)
    }

    private func configureButtons(with buttons: [GameChoiceButton]) {
        firstButtonConfigure(with: buttons[0])
        secondButtonConfigure(with: buttons[1])
    }
    
    private func firstButtonConfigure(with first: GameChoiceButton) {
        view.addSubview(first)
        first.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            first.bottomAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)-10),
            first.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            first.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            first.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
    private func secondButtonConfigure(with second: GameChoiceButton) {
        view.addSubview(second)
        second.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            second.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)+10),
            second.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            second.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            second.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
}

