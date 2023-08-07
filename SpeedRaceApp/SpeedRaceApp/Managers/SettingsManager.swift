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
        TypesForSetting(nameOfSetting: "Звук", switcher: true, type: .switchSetting),
        TypesForSetting(nameOfSetting: "Тема", switcher: false, type: .switchSetting),
        TypesForSetting(nameOfSetting: "Яркость", type: .openSetting),
        TypesForSetting(nameOfSetting: "Сложность", type: .openSetting),
        TypesForSetting(nameOfSetting: "Никнейм", type: .openSetting)
    ]
}
