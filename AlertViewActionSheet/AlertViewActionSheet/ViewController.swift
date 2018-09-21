//
//  ViewController.swift
//  AlertViewActionSheet
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        let buttonAlertView = UIButton(type: UIButtonType.system)
        buttonAlertView.setTitle("Test警告框", for: UIControlState.normal)
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        buttonAlertView.frame = CGRect(x: (screen.size.width - buttonAlertViewWidth) / 2, y: buttonAlertViewTopView, width: buttonAlertViewWidth, height: buttonAlertViewHeight)
        
        //指定事件处理方法
        buttonAlertView.addTarget(self, action: #selector(ViewController.onAlertViewButonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(buttonAlertView)
        
        let buttonSheetView = UIButton(type: UIButtonType.system)
        buttonSheetView.setTitle("显示Sheet", for: UIControlState.normal)
        
        buttonSheetView.frame = CGRect(x: (screen.size.width - buttonAlertViewWidth) / 2, y: buttonAlertViewTopView + buttonAlertView.frame.height, width: buttonAlertViewWidth, height: buttonAlertViewHeight)
        
        buttonSheetView.addTarget(self, action: #selector(ViewController.onSheetViewButonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(buttonSheetView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onAlertViewButonClick(sender: Any) -> Void {
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Alert text message", preferredStyle: UIAlertControllerStyle.alert)
        
        let noAction = UIAlertAction(title: "NO", style: UIAlertActionStyle.cancel) {
            (alertAction) -> Void in
            NSLog("Tap No Button")
            
        }
        
        let yesAction = UIAlertAction(title: "YES", style: UIAlertActionStyle.default) {
            (alertAction) -> Void in
            NSLog("Tap YES Button")
            
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onSheetViewButonClick(sender: Any) -> Void {
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Alert text message", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let firstAction = UIAlertAction(title: "选则第一个", style: UIAlertActionStyle.cancel) {
            (alertAction) -> Void in
            NSLog("Tap first Button")
            
        }
        
        let secondAction = UIAlertAction(title: "选则第2个", style: UIAlertActionStyle.default) {
            (alertAction) -> Void in
            NSLog("Tap second Button")
        }
        
        let thirdAction = UIAlertAction(title: "选则第3个", style: UIAlertActionStyle.default) {
            (alertAction) -> Void in
            NSLog("Tap third Button")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(thirdAction)
        
        //显示
        self.present(alertController, animated: true, completion: nil)
    }


}

