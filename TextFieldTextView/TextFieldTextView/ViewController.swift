//
//  ViewController.swift
//  TextFieldTextView
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //注册键盘出现通知
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        
        // 注册键盘隐藏通知
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 注销键盘出现通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        // 注销键盘消失通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    
    func keyboardDidShow(notification: Notification) {
        NSLog("键盘打开")
    }
    
    func keyboardDidHide(notification: Notification) {
        NSLog("键盘关闭")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("TextField获得焦点")
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            NSLog("TextView获得焦点,点击return键")
            return false
        }
        return true
    }
    
}

