//
//  SettingViewController.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    let settings = SettingsManager.share.settingsStrings
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let switchForSettingCell = UINib(nibName: "SwitchForSettingCell", bundle: Bundle.main)
        TableView.register(switchForSettingCell, forCellReuseIdentifier: "SwitchForSettingCell")
        let cellForSetting = UINib(nibName: "SettingTableViewCell", bundle: Bundle.main)
        TableView.register(cellForSetting, forCellReuseIdentifier: "SettingTableViewCell")
        TableView.dataSource = self
    }
}
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        if settings[index].type == .openSetting {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
            cell.nameOfSetting.text = settings[index].nameOfSetting
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchForSettingCell", for: indexPath) as! SwitchForSettingCell
            cell.nameForSettingSwitch.text = settings[index].nameOfSetting
            cell.switchForSetting.isOn = (settings[index].switcher as? Bool) ?? false
            return cell
        }
    }
}

