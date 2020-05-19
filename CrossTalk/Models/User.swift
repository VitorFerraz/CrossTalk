//
//  User.swift
//  CrossTalk
//
//  Created by Vitor Ferraz Varela on 19/05/20.
//  Copyright © 2020 vitor.ferrazvarela. All rights reserved.
//

import UIKit

class User {
    static let local = User()
    let id = UUID()
    var name: String {
        UIDevice.current.name
    }
    private init() {}
}
