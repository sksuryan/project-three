//
//  User.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/12/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

struct User: Codable {
    var name: String
    var email: String
    var password: String
    var isSpeaker: Bool
}
