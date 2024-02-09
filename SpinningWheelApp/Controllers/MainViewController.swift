//
//  MainViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel = GameChoiceButtonViewModel(tittle: "Countriesesese", emodji: "😀")

    let firstButton = GameChoiceButton()
    let secondButton = GameChoiceButton()
    let thirdButton = GameChoiceButton()
    let fourthButton = GameChoiceButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        configureButtons(with: viewModel)
        addButtonsConstraints()
    }
    
    private func configureButtons(with viewModel: GameChoiceButtonViewModel) {
        firstButton.configure(with: viewModel)
        secondButton.configure(with: GameChoiceButtonViewModel(tittle: "Countriesesese wowowowowo", emodji: "🦃"))
        thirdButton.configure(with: viewModel)
        fourthButton.configure(with: GameChoiceButtonViewModel(tittle: "Countriesesese wowowowowo", emodji: "🦃"))
    }

    private func addButtonsConstraints() {
        firstButtonConstraintConfigure(with: firstButton)
        secondButtonConstraintConfigure(with: secondButton)
        thirdButtonConstraintConfigure(with: thirdButton)
        fourthButtonConstraintConfigure(with: fourthButton)
    }
    
    private func firstButtonConstraintConfigure(with first: GameChoiceButton) {
        view.addSubview(first)
        first.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            first.bottomAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)-10),
            first.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            first.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            first.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
    private func secondButtonConstraintConfigure(with second: GameChoiceButton) {
        view.addSubview(second)
        second.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            second.bottomAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)-10),
            second.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            second.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            second.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func thirdButtonConstraintConfigure(with third: GameChoiceButton) {
        view.addSubview(third)
        third.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            third.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)+10),
            third.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            third.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            third.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func fourthButtonConstraintConfigure(with fourth: GameChoiceButton) {
        view.addSubview(fourth)
        fourth.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourth.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2)+10),
            fourth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fourth.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            fourth.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4)
        ])
    }
}

