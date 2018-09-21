//
//  ViewController.swift
//  SimpeTable
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabelView: UITableView!
    
    var listTeams: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        self.tabelView.delegate = self
        self.tabelView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let row = indexPath.row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = "\(rowDict["image"] as! String).png"
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

}

