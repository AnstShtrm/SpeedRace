//
//  SettingsModel.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import Foundation

struct TypesForSetting {
    var nameOfSetting: String
    var switcher: Any?
    var type: TypeOfCell
}

enum TypeOfCell {
    case openSetting
    case switchSetting
}
