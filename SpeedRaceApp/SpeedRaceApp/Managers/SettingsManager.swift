//
//  SettingsManager.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import Foundation

class SettingsManager {
    public static var share = SettingsManager()
    private init () {}
    var settingsStrings: [TypesForSetting] = [
        TypesForSetting(nameOfSetting: "Sound", switcher: true, type: .switchSetting),
        TypesForSetting(nameOfSetting: "Color", switcher: false, type: .switchSetting),
        TypesForSetting(nameOfSetting: "Language", type: .openSetting),
        TypesForSetting(nameOfSetting: "Level", type: .openSetting),
        TypesForSetting(nameOfSetting: "User Name", type: .openSetting)
    ]
}
