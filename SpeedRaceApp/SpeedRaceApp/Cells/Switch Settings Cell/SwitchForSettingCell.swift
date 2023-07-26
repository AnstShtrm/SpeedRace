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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func switchChange (_ sender: Any){
    }
    
}
