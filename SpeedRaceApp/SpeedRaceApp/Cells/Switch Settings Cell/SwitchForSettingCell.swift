//
//  SwitchForSettingCell.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import UIKit

class SwitchForSettingCell: UITableViewCell {

    @IBOutlet weak var nameForSettingSwitch: UILabel!
    
    @IBOutlet weak var switchForSetting: UISwitch!
    
    weak var delegate: SettingDelegate?

    @IBAction func switchChange (_ sender: Any){
    delegate?.cell(self, changeValueTo: switchForSetting.isOn)
    }
}

protocol SettingDelegate: AnyObject {
    func cell (_ cell: SwitchForSettingCell, changeValueTo isOn: Bool)
}
