//
//  EventCell.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/19/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    let nameLabel = UILabel()
    let dateLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureLabels(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            dateLabel.widthAnchor.constraint(equalToConstant: 200),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
