//
//  GameViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class GameViewController: UIViewController {
    private let firstIcon = UILabel()
    private let secondIcon = UILabel()
    private let thirdIcon = UILabel()
    
    let spinnButton = UIButton()
    let goBackButton = UIButton()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    var gameSet = [String]()
    var iconsSet = Set<String>()
    var gameIcons = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choseGameIcons(from: gameSet)
        setGameIcons()
        setSpinnButton()
        setGoBackButton()
        
        self.view.addSubview(stackView)
        configureStackView()
        self.view.addSubview(goBackButton)
        configureGoBackButton()
        self.view.addSubview(spinnButton)
        configureSpinnButton()

        view.backgroundColor = UIColor.systemPink
    }
    
    private func choseGameIcons(from array: [String]) {
        while iconsSet.count < 3 {
            iconsSet.insert(gameSet[Int.random(in: 0..<gameSet.count)])
        }
        for item in iconsSet {
            gameIcons.append(item)
        }
    }
    
    private func setGameIcons() {
        let gameIconsArray = [firstIcon, secondIcon, thirdIcon]
        for icon in gameIconsArray {
            setIconLabel(emodji: icon)
            icon.text = gameIcons[Int.random(in: 0..<3)]
        }
    }
    
    //MARK: - Button action
    @objc private func gameChoiceButtonPressed(sender: UIButton) {
        setGameIcons()
    }

    // MARK: - Navigation
     @objc private func backToMainVC(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
     }

    
    //MARK: - ViewConfiguration
    
    private func setGoBackButton() {
        goBackButton.setImage(UIImage(named: "back"), for: .normal)
    }
    
    private func setSpinnButton() {
        spinnButton.backgroundColor = UIColor.systemGreen
        spinnButton.layer.cornerRadius = 80
        spinnButton.layer.borderWidth = 5
        spinnButton.layer.borderColor = UIColor.black.cgColor
        spinnButton.setTitle("SPINN!", for: .normal)
        spinnButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        spinnButton.titleLabel?.textColor = UIColor.white
        spinnButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
    }
    
    private func setIconLabel(emodji: UILabel) {
        emodji.numberOfLines = 1
        emodji.textAlignment = .center
        emodji.contentMode = .center
        emodji.font = UIFont(name: "AppleColorEmoji", size:100)
    }
    
    private func configureGoBackButton(){
        goBackButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goBackButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            goBackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            goBackButton.widthAnchor.constraint(equalToConstant: 60),
            goBackButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func configureStackView() {
        stackView.addArrangedSubview(firstIcon)
        stackView.addArrangedSubview(secondIcon)
        stackView.addArrangedSubview(thirdIcon)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -60),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func configureSpinnButton() {
        spinnButton.addTarget(self, action: #selector(gameChoiceButtonPressed), for: .touchUpInside)
        spinnButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 120),
            spinnButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            spinnButton.widthAnchor.constraint(equalToConstant: 160),
            spinnButton.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}
