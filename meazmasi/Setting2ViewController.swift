//
//  Setting2ViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/02/09.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit

class Setting2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    let userDefaults = UserDefaults.standard
    @IBOutlet var textField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = Locale(identifier: "ja_JP")
        
        datePicker.minuteInterval = 5
        
        textField.delegate = self

        
        if let labelText = userDefaults.string(forKey:"nameLabel") {
            nameLabel.text = labelText
        }

        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //データ変更時の呼び出しメソッド
    @IBAction func changeDate(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
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
