//
//  OnboardingPage.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class OnboardingPage: UIView {

    var message: String!
    var imageName: String!
    var isLastPage: Bool! = false
    var color: UIColor!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let continueButton = TAIButton(text: "Continue")
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()
    
    
    required init(message: String, imageName: String, isLastPage: Bool, color: UIColor) {
        super.init(frame: .zero)
        self.message = message
        self.imageName = imageName
        self.isLastPage = isLastPage
        self.color = color
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = color
        self.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.50).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        
        let image = UIImage(named: self.imageName)
        imageView.image = image
        self.addSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        
        messageLabel.text = message
        self.addSubview(messageLabel)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(messageLabel)

        if isLastPage{
            self.addSubview(continueButton)
            continueButton.addTarget(self, action: #selector(pushNavigationController), for: .touchUpInside)
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
            continueButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func pushNavigationController(){
        self.window!.rootViewController = createLoginNC()
    }
    
    func setGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 3.0]
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func createLoginNC() -> UINavigationController {
        let loginVC = LoginVC()
        return UINavigationController(rootViewController: loginVC)
        
    }
    
    override func layoutSubviews() {
        setGradient()
    }
}
