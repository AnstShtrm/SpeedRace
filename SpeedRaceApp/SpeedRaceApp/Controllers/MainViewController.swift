//
//  MainViewController.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 27/07/2023.
//

import UIKit

class MainViewController: UIViewController{
    
    @IBAction func startSpeedRace(_ sender: Any) {
        let destinattion = SpeedRaceViewController ()
        navigationController?.pushViewController(destinattion, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



