//
//  SideMenuViewController.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 07/08/2023.
//

import UIKit
import Lottie


class SideMenuViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    
    var animationLottie: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationLottie = .init(name: "carAnimation")
        animationLottie.frame = animationView.bounds
        animationLottie.contentMode = .scaleAspectFit
        animationLottie.loopMode = .loop
        animationLottie.animationSpeed = 1.5
        animationView.addSubview(animationLottie!)
        animationLottie.play()
    }
}
