//
//  SettingViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/01/19.
//  Copyright © 2017年 山本有紗. All rights reserved.
//


import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet var seibetuPickerView: UIPickerView!
    @IBOutlet var nennreiPickerView: UIPickerView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        seibetuPickerView.delegate = self
        nennreiPickerView.delegate = self
        
        seibetuPickerView.dataSource = self
        nennreiPickerView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //要素の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    //行数&選択肢の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if seibetuPickerView == pickerView{
            return 2
        } else {
            return 6
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
            <#code#>
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
