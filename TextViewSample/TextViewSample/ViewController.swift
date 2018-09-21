//
//  ViewController.swift
//  TextViewSample
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let aStr = "県民生活部 青少年課 \n 郵便番号330-9301 \n 埼玉県さいたま市浦和区高砂三丁目15番1号 \n 本庁舎3階 電話：048-830-2912 \n メール：test@test.com \nサイト：https://www.pref.saitama.lg.jp/a0307/seisyounensesaku/22kazokufureai.html"
        
        
//        textView.isEditable = false
//        textView.dataDetectorTypes = UIDataDetectorTypes.all
//        textView.linkTextAttributes = [ NSAttributedStringKey.foregroundColor.rawValue: UIColor.green,
//                                       NSAttributedStringKey.underlineColor.rawValue: UIColor.lightGray,
//                                       NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue]
//        let attributedString = NSMutableAttributedString(string: aStr)
//        textView.attributedText = attributedString;
//        textView.tintColor = UIColor.blue
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

