//
//  Player.swift
//  soccerDad
//
//  Created by Ayse Kula on 2/24/19.
//  Copyright © 2019 gokhan Kula. All rights reserved.
//

import Foundation

class Player : Codable {
    var name : String = ""
    var done : Bool = true
    //var lastName : String = ""
    //var number : Int = 1
    var skill : Int = 1
    
}

class PlayerInGame : Player {
    var minutesPlayed : Int = 0
}
