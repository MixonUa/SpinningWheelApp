//
//  MainViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    let dataManager = DataManager()
    let viewModel = GameChoiceButtonViewModel(tittle: "Countriesesese", emodji: "😀")

    let firstButton = GameChoiceButton()
    let secondButton = GameChoiceButton()
    let thirdButton = GameChoiceButton()
    let fourthButton = GameChoiceButton()
    
    var emodjiData = [EmodjiDataModel]()
    var error: String = ""
    var titlesSet = Set<String>()
    var sortedEmodjis: [String:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        titlesSet = dataManager.getSortedTitlesSet(from: emodjiData)
        sortedEmodjis = dataManager.sortEmodji(from: emodjiData, by: titlesSet)
        print(sortedEmodjis)
        print(titlesSet)
        configureButtons(with: viewModel)
        addButtonsConstraints()
    }
    
    @objc private func gameChoiceButtonPressed(sender: GameChoiceButton) {
        guard let gameSet = sender.gameTitleLabel.text else { return }
        print(gameSet)
        sender.shakeButton()
        presentVC(with: gameSet)
    }
    
    // MARK: - Navigation
    private func presentVC(with gameSet: String) {
        let nextVC = GameViewController()
        nextVC.gameSet = gameSet
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - Game Choice Buttons configaration
    private func configureButtons(with viewModel: GameChoiceButtonViewModel) {
        firstButton.configure(with: viewModel)
        firstButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        secondButton.configure(with: GameChoiceButtonViewModel(tittle: "Countriesesese wowowowowo", emodji: "🦃"))
        secondButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        thirdButton.configure(with: viewModel)
        thirdButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        fourthButton.configure(with: GameChoiceButtonViewModel(tittle: "Countriesesese wowowowowo", emodji: "🦃"))
        fourthButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
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

