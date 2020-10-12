//
//  TAITextField.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class TAITextField: UITextField {


        override init(frame: CGRect) {
            super.init(frame:frame)
            configure()
        }
        
        init(text: String) {
            super.init(frame: .zero)
            placeholder = text
            configure()

            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure(){
            translatesAutoresizingMaskIntoConstraints = false
            
            layer.cornerRadius = 10
            
            
            textColor = .label
            tintColor = .label
            textAlignment = .center
            font = UIFont.preferredFont(forTextStyle: .title2)
            adjustsFontSizeToFitWidth = true
            minimumFontSize = 12
            
            backgroundColor = .tertiarySystemBackground
            autocorrectionType = .no
            returnKeyType = .go
        }
        
    }
