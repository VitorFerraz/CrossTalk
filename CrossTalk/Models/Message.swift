//
//  Message.swift
//  CrossTalk
//
//  Created by Vitor Ferraz Varela on 19/05/20.
//  Copyright © 2020 vitor.ferrazvarela. All rights reserved.
//

import Foundation
struct Message: Codable, Identifiable {
    let id = UUID()
    let username: String
    let value: String
    let timestamp: String
    
    var isFromLocalUser: Bool { username == User.local.name}
}
