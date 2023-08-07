//
//  SpeedRaceViewController.swift
//  SpeedRaceApp
//
//  Created by Nastya Shturma on 27/07/2023.
//

import UIKit

class SpeedRaceViewController: UIViewController {
    
    @IBOutlet weak var carPositionSegmentControl: UISegmentedControl!
    
    var carImage = UIImageView(image: UIImage(named: "car"))
    var treeImage = UIImageView(image: UIImage(named: "tree"))
    var ufoImage = UIImageView(image: UIImage(named: "UFO"))
    var stumpImage = UIImageView(image: UIImage(named: "stump"))
    var rockImage = UIImageView(image: UIImage(named: "rock"))
    var stopImage = UIImageView(image: UIImage(named: "stop"))
    
    var leftOriginCoordinate: CGFloat = 0
    var centerOriginCoordinate: CGFloat = 0
    var rightOriginCoordinate: CGFloat = 0
    
    var elementSize: CGFloat = 0
    var defaultPadding: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lSwipe = UISwipeGestureRecognizer()
        lSwipe.direction = .left
        lSwipe.addTarget(self, action: #selector(swipe))
                
        let rSwipe = UISwipeGestureRecognizer()
        rSwipe.direction = .right
        rSwipe.addTarget(self, action: #selector(swipe))
                
        view.addGestureRecognizer(lSwipe)
        view.addGestureRecognizer(rSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCoordinates()
        setupFrames ()
    }
    
    func setupCoordinates () {
        let screenWidth = view.frame.size.width
        
        elementSize = screenWidth / 4
        leftOriginCoordinate = elementSize / 4
        centerOriginCoordinate = elementSize + 2 * leftOriginCoordinate
        rightOriginCoordinate = 2 * elementSize + 3 * leftOriginCoordinate
    }
    
    func setupFrames () {
        let screenHeight = view.frame.size.height
        let bottomSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        let topSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.size.height ?? 0
        let yCoordinateOfCar = screenHeight - bottomSafeAreaPadding - defaultPadding - elementSize
        
        carImage.frame = CGRect(x: centerOriginCoordinate, y: yCoordinateOfCar, width: elementSize, height: elementSize)
        
        view.addSubview(carImage)
        
        let yCoordinateOfTree = (screenHeight - elementSize) / 2
        treeImage.frame = CGRect(x: leftOriginCoordinate, y: yCoordinateOfTree, width: elementSize, height: elementSize)
        
        view.addSubview(treeImage)
        
        let yCoordinateOfRock = topSafeAreaPadding + navigationBarHeight + defaultPadding
        rockImage.frame = CGRect(x: rightOriginCoordinate, y: yCoordinateOfRock, width: elementSize, height: elementSize)
        
        view.addSubview(rockImage)
    }
    
    @objc func swipe (sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left : swipeLeft()
        case .right : swipeRight()
        default: return
        }
    }
    
    func swipeLeft () {
        
        UIView.animate(withDuration: 0.4) { [weak self] in
            if self?.carImage.frame.origin.x == self?.rightOriginCoordinate {
                self?.carImage.frame.origin.x = self!.centerOriginCoordinate
            }
            else if self?.carImage.frame.origin.x == self?.centerOriginCoordinate {
                self?.carImage.frame.origin.x = self!.leftOriginCoordinate
            }
            else {
                return
            }
        }
    }
    
    func swipeRight () {
        
        UIView.animate(withDuration: 0.4) { [weak self] in
            
            if self?.carImage.frame.origin.x == self?.leftOriginCoordinate {
                self?.carImage.frame.origin.x = self!.centerOriginCoordinate
            }
            else if self?.carImage.frame.origin.x == self?.centerOriginCoordinate {
                self?.carImage.frame.origin.x = self!.rightOriginCoordinate
            }
            else {
                return
            }
        }
    }
    
    @IBAction func changeCarPosition(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: carImage.frame.origin.x = leftOriginCoordinate
            treeImage.frame.origin.x = rightOriginCoordinate
            rockImage.frame.origin.x = centerOriginCoordinate
        case 2: carImage.frame.origin.x = rightOriginCoordinate
            treeImage.frame.origin.x = centerOriginCoordinate
            rockImage.frame.origin.x = leftOriginCoordinate
        default: carImage.frame.origin.x = centerOriginCoordinate
            treeImage.frame.origin.x = leftOriginCoordinate
            rockImage.frame.origin.x = rightOriginCoordinate
        }
    }
}
