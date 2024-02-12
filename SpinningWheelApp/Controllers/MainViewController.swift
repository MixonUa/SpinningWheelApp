//
//  MainViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    let dataManager = DataManager()
    var emodjiData = [EmodjiDataModel]()
    var viewModels = [GameChoiceButtonViewModel]()

    let firstButton = GameChoiceButton()
    let secondButton = GameChoiceButton()
    let thirdButton = GameChoiceButton()
    let fourthButton = GameChoiceButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        viewModels = dataManager.prepareViewModels(from: emodjiData)
        configureButtons(with: viewModels)
        addButtonsConstraints()
    }
    
    // MARK: - Button action
    @objc private func gameChoiceButtonPressed(sender: GameChoiceButton) {
        sender.shakeButton()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.presentVC(with: sender.gameSet)
        }
    }
    
    // MARK: - Navigation
    private func presentVC(with gameSet: [String]) {
        let nextVC = GameViewController()
        nextVC.gameSet = gameSet
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - ViewConfiguration
    private func configureButtons(with viewModels: [GameChoiceButtonViewModel]) {
        firstButton.configure(with: viewModels[0])
        firstButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        secondButton.configure(with: viewModels[1])
        secondButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        thirdButton.configure(with: viewModels[2])
        thirdButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        fourthButton.configure(with: viewModels[3])
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

