//
//  GameViewController.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class GameViewController: UIViewController {
    let firstIcon = UILabel()
    let secondIcon = UILabel()
    let thirdIcon = UILabel()
    let winLabel = UILabel()
    let scoreLabel = UILabel()
    
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
    let storage = UserDefaults.standard
    var win = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choseGameIcons(from: gameSet)
        setAllViews()
        configureAllViews()
        
        view.backgroundColor = UIColor.systemPink
        winLabel.isHidden = true
    }
    
    private func checkWining() {
        if firstIcon.text == secondIcon.text && secondIcon.text == thirdIcon.text {
            win = 300
            let oldScore = storage.integer(forKey: "score")
            let newScore = oldScore + win
            storage.setValue((newScore), forKey: "score")
            updateScoreLabel()
            updateWinLabel()
        } else if firstIcon.text == secondIcon.text || secondIcon.text == thirdIcon.text {
            win = 100
            let oldScore = storage.integer(forKey: "score")
            let newScore = oldScore + win
            storage.setValue((newScore), forKey: "score")
            updateScoreLabel()
            updateWinLabel()
        }
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "💰\(storage.integer(forKey: "score"))"
    }
    
    private func updateWinLabel() {
        UILabel.animate(withDuration: 0.5) {
            self.winLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.winLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        winLabel.text = "WIN \(win)"
        winLabel.isHidden = false
    }
    
    private func choseGameIcons(from array: [String]) {
        while iconsSet.count < 3 {
            iconsSet.insert(gameSet[Int.random(in: 0..<gameSet.count)])
        }
        for item in iconsSet {
            gameIcons.append(item)
        }
    }
    
    //MARK: - Button action
    @objc private func gameChoiceButtonPressed(sender: UIButton) {
        winLabel.isHidden = true
        let cost = 50
        let oldScore = storage.integer(forKey: "score")
        let newScore = oldScore - cost
        storage.setValue((newScore), forKey: "score")
        updateScoreLabel()
        setGameIcons()
        checkWining()
    }

    // MARK: - Navigation
     @objc private func backToMainVC(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
     }

    
    //MARK: - ViewConfiguration
    private func setAllViews() {
        setGameIcons()
        setSpinnButton()
        setGoBackButton()
        setScoreLabel()
        setWinLabel()
    }
    
    private func setGameIcons() {
        let gameIconsArray = [firstIcon, secondIcon, thirdIcon]
        for icon in gameIconsArray {
            setIconLabel(emodji: icon)
            icon.text = gameIcons[Int.random(in: 0..<3)]
        }
        UIView.transition(with: firstIcon, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: secondIcon, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: thirdIcon, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
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
        emodji.font = UIFont(name: "AppleColorEmoji", size:90)
    }
    
    private func setScoreLabel() {
        scoreLabel.text = "💰\(storage.integer(forKey: "score"))"
        scoreLabel.numberOfLines = 1
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont(name: "AppleSDGothicNeo", size:20)
        scoreLabel.textColor = UIColor.yellow
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.layer.borderWidth = 5
        scoreLabel.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setWinLabel() {
        winLabel.numberOfLines = 1
        winLabel.textAlignment = .center
        winLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size:30)
        winLabel.textColor = UIColor.black
    }
    
    //MARK: - ViewConstraints
    private func configureAllViews() {
        self.view.addSubview(scoreLabel)
        configureScoreLabel()
        self.view.addSubview(goBackButton)
        configureGoBackButton()
        self.view.addSubview(stackView)
        configureStackView()
        self.view.addSubview(winLabel)
        configureWinLabel()
        self.view.addSubview(spinnButton)
        configureSpinnButton()
    }
    private func configureScoreLabel() {
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            scoreLabel.widthAnchor.constraint(equalToConstant: 100),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureWinLabel() {
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -30),
            winLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            winLabel.widthAnchor.constraint(equalToConstant: 200),
            winLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureGoBackButton() {
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
