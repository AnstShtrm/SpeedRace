//
//  SettingViewController.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 26/07/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var settings = SettingsManager.share.settingsStrings
    lazy var items:[TypesForSetting] = settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let switchForSettingCell = UINib(nibName: "SwitchForSettingCell", bundle: Bundle.main)
        TableView.register(switchForSettingCell, forCellReuseIdentifier: "SwitchForSettingCell")
        let cellForSetting = UINib(nibName: "SettingTableViewCell", bundle: Bundle.main)
        TableView.register(cellForSetting, forCellReuseIdentifier: "SettingTableViewCell")
        TableView.dataSource = self
        
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        settings = items
        SettingsManager.share.settingsStrings = items
        TableView.reloadData()
    }
    
    @IBAction func cancelChanges(_ sender: Any) {
        items = settings
        TableView.reloadData()
    }
}
extension SettingViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        switch items[index].type {
        case.openSetting : guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
            cell.nameOfSetting.text = items[index].nameOfSetting

            return cell
            
        case.switchSetting: let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchForSettingCell", for: indexPath) as! SwitchForSettingCell
            cell.nameForSettingSwitch.text = items[index].nameOfSetting
            cell.switchForSetting.isOn = (items[index].switcher as? Bool) ?? false
            cell.delegate = self
            return cell
        }
    }
}

extension SettingViewController: SettingDelegate {
    func cell(_ cell: SwitchForSettingCell, changeValueTo isOn: Bool) {
        guard let index = TableView.indexPath(for: cell)?.row else { return }
        items[index].switcher = isOn
        cell.delegate = self
    }
}

protocol SettingDelegate: AnyObject {
    func cell (_ cell: SwitchForSettingCell, changeValueTo isOn: Bool)
}



