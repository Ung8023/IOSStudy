//
//  ViewController.swift
//  CollectionViewSample
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var events: NSArray!
    let COL_NUM = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let plistPath = bundle.path(forResource: "events", ofType: "plist")
        //获取属性列表文件中的全部数据
        events = NSArray(contentsOfFile: plistPath!)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num = self.events.count % COL_NUM
        let count = self.events.count / COL_NUM
        if num == 0 {
            return count
        }else {
            return count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = self.events.count % COL_NUM
        if count == 0 {
            return COL_NUM
        }else {
            if section == self.events.count / COL_NUM {
                return 1
            }else {
                return COL_NUM
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        NSLog("\(indexPath.section * COL_NUM + indexPath.row)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! EventCollectionViewCell
        
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        cell.image.image = UIImage(named: event["image"] as! String)
        
        return cell
    }
    
    
}

