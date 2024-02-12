//
//  GameChoiceButton.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 07.02.2024.
//

import UIKit

class GameChoiceButton: UIButton {
    public var gameSet = [String]()
    
    private let gameEmodjiLabel: UILabel = {
        let emodji = UILabel()
        emodji.numberOfLines = 1
        emodji.textAlignment = .center
        emodji.contentMode = .center
        emodji.font = UIFont(name: "AppleColorEmoji", size:80)
        return emodji
    }()
    
    public let gameTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.contentMode = .bottom
        label.font = UIFont(name: "Gill Sans Bold", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(gameEmodjiLabel)
        addSubview(gameTitleLabel)
        
        styleButton()
        
        backgroundColor = UIColor.yellow
    }
    
    init() {
        super.init(frame: .zero)
        addSubview(gameEmodjiLabel)
        addSubview(gameTitleLabel)
        
        styleButton()
        
        backgroundColor = UIColor.yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: GameChoiceButtonViewModel) {
        gameTitleLabel.text = viewModel.tittle
        gameEmodjiLabel.text = viewModel.emodji
        gameSet = viewModel.emodjiSet
    }
    
    
    private func styleButton() {
        layer.cornerRadius = 20
        layer.borderWidth = 3
        layer.borderColor = UIColor.darkGray.cgColor
    }
    
    public func shakeButton() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.15
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gameEmodjiLabel.frame = CGRect(x: 0,
                                     y: 14,
                                     width: frame.width,
                                     height: (frame.height-60)
        ).integral
        
        gameTitleLabel.frame = CGRect(x: 0,
                                     y: (frame.height-48),
                                     width: frame.width,
                                     height: 42
        ).integral
    }
}
