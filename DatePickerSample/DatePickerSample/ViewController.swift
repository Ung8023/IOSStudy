//
//  ViewController.swift
//  DatePickerSample
//

//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onOkCLick(_ sender: Any) {
        let theDate = self.datePicker.date
        let desc = theDate.description(with: Locale.current)
        NSLog(desc)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        self.label.text = dateFormatter.string(from: theDate)
        
    }
    
}

