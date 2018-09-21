//
//  ViewController.swift
//  PickerViewSample
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var pickerData: NSDictionary!
    var pickerProvinceData: NSArray!
    var pickerCityData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "province_cities", ofType: "plist")
        //获取属性文件中的所有数据
        let dic = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dic
        
        //省份名数据
        self.pickerProvinceData = self.pickerData.allKeys as NSArray
        
        //默认取出第一个省的所有数据
        let selectedProvice = self.pickerProvinceData[0] as! String
        self.pickerCityData = self.pickerData[selectedProvice] as! NSArray
        
        self.picker.delegate = self
        self.picker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onOkButtonClick(_ sender: Any) {
        let row1 = self.picker.selectedRow(inComponent: 0)
        let row2 = self.picker.selectedRow(inComponent: 1)
        
        let selected1 = self.pickerProvinceData[row1] as! String
        let selected2 = self.pickerCityData[row2] as! String
        
        let title = "\(selected1), \(selected2)"
        self.label.text = title
        
    }
    
    // UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { // 省的个数
            return self.pickerProvinceData.count
        }else { //市的个数
            return self.pickerCityData.count
        }
    }
    
    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { //选择省名
            return self.pickerProvinceData[row] as? String
        }else {
            return self.pickerCityData[row] as? String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            let selectedProvince = self.pickerProvinceData[row] as? String
            self.pickerCityData = self.pickerData[selectedProvince] as? NSArray
            self.picker.reloadComponent(1)
        }
    }
}

