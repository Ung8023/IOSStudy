//
//  ViewController.swift
//  UploadDownloadIndicator
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onActivityIndicatorClick(_ sender: Any) {
        if self.activityIndicator.isAnimating {
            self.activityIndicator.stopAnimating()
        }else {
            self.activityIndicator.startAnimating()
        }
    }
    
    @IBAction func onDownLoadClick(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.download), userInfo: nil, repeats: true)
    }
    
    @objc func download() {
        self.progressView.progress += 0.1
        if self.progressView.progress == 1.0 {
            self.timer.invalidate()
            
            let alertController: UIAlertController = UIAlertController(title: "download ok", message: "download ok", preferredStyle: UIAlertControllerStyle.alert)
            
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

