//
//  SettingTableViewCell.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    @IBOutlet weak var nameOfSetting: UILabel!
    
    func setupValues (nameForSetting: String) {
        nameOfSetting.text = nameForSetting
    }
}
