//
//  ViewController.swift
//  LinearLoadingBar
//
//  Created by der1598c on 08/18/2019.
//  Copyright (c) 2019 der1598c. All rights reserved.
//

import UIKit
import LinearLoadingBar

class ViewController: UIViewController {
    
    @IBOutlet var progressSlider: UISlider!
    @IBOutlet var barInsetSlider: UISlider!
    @IBOutlet var isCornerRoundedSwitch: UISwitch!
    @IBOutlet var isTitleShowedSwitch: UISwitch!
    @IBOutlet var titleTxtF: UITextField!
    @IBOutlet var cornerRadiusSlider: UISlider!
    
    @IBOutlet var linearProgressView: LinearLoadingBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linearProgressView.animationDuration = 0.5
        
        progressSlider.addTarget(self, action: #selector(updateLinearProgressView), for: .valueChanged)
        barInsetSlider.addTarget(self, action: #selector(updateLinearProgressView), for: .valueChanged)
        isCornerRoundedSwitch.addTarget(self, action: #selector(updateLinearProgressView), for: .valueChanged)
        isTitleShowedSwitch.addTarget(self, action: #selector(updateLinearProgressView), for: .valueChanged)
        cornerRadiusSlider.addTarget(self, action: #selector(updateLinearProgressView), for: .valueChanged)
    }
    
    @objc
    func updateLinearProgressView() {
        linearProgressView.setProgress( progressSlider.value, animated: true)
        linearProgressView.barInset =  CGFloat(barInsetSlider.value)
        linearProgressView.isCornersRounded = isCornerRoundedSwitch.isOn
        linearProgressView.isTitleShowed = isTitleShowedSwitch.isOn
        linearProgressView.cornerRadiusValue = cornerRadiusSlider.value
    }
    @IBAction func didTapRandomColorButton(_ sender: Any) {
        linearProgressView.barColor = .random
        linearProgressView.titleColor = .random
        linearProgressView.trackColor = .random
    }
    @IBAction func didTapSetTitleButton(_ sender: Any) {
        if let title = titleTxtF.text {
            linearProgressView.titleString = title
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}
