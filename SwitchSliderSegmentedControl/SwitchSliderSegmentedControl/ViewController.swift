//
//  ViewController.swift
//  SwitchSliderSegmentedControl
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var left: UISwitch!
    @IBOutlet weak var right: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchValueChanged(_ sender: AnyObject) {
        let witchSitch = sender as? UISwitch
        let setting = witchSitch?.isOn
        self.left.setOn(setting!, animated: true)
        self.right.setOn(setting!, animated: true)
    }

    @IBAction func touchDown(_ sender: Any) {
        let segmentedControl = sender as! UISegmentedControl
        
        NSLog("选择的是: %li", segmentedControl.selectedSegmentIndex)
        
        if self.left.isOn {
            self.right.setOn(false,animated: true)
            self.left.setOn(false,animated: true)
        }else {
            self.right.setOn(true,animated: true)
            self.left.setOn(true,animated: true)
        }
    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        let slider = sender as! UISlider
        let progressAsInt = Int(slider.value * 100)
        let newText = String(progressAsInt)
        NSLog(newText)
    }
    
}

