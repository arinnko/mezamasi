//
//  Setting2ViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/02/09.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import UserNotifications

class Setting1ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    let userDefaults = UserDefaults.standard
    let now = NSDate()
    var setTime: Data!
    @IBOutlet var textField:UITextField!
    @IBOutlet var apuri5ImageView: UIImageView!
    
    var hour:Int!
    var minute:Int!
    
    var backgroundnumber:Int!
    
    //最初に呼ばれるとこ
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.datePickerMode = .time
        
        self.view.addSubview(datePicker)
        
        datePicker.minuteInterval = 5
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        getNow()
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        backgroundnumber = userDefaults.integer(forKey: "background")
        if backgroundnumber == 1{
            apuri5ImageView.image = UIImage(named: "apuri20")
        }
        
        if backgroundnumber == 2{
            apuri5ImageView.image = UIImage(named:"apuri5")
        }
        
        
        
    }

    
    //ぴっかぁ動かさないと落ちちゃうから、このコードをかいたよぉーーー
    func getNow() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        print(formatter.string(from: datePicker.date))
        
        print("日付が変わったよ")
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: datePicker.date)
        hour = calendar.component(.hour, from: datePicker.date)
        minute = calendar.component(.minute, from: datePicker.date)
        
    }
    
    func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        print(formatter.string(from: sender.date))
        
        print("日付が変わったよ")
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: sender.date)
        hour = calendar.component(.hour, from: sender.date)
        minute = calendar.component(.minute, from: sender.date)
    }

//    //時間と分を取得
//    func getHourAndMin(date: Date)->String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        let text = formatter.string(from: date)
//        return text
//    }
//    
//    func getTimeToAlert(time1: String, time2: String) {
//        
//    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        /*setTime = datePicker.date
        let nowTime = Date()
        let dif = setTime.timeIntervalSince(nowTime)
        print(dif)*/
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updatePickerValue(){
        
    }
    
    
    
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
        
    @IBAction func tapButton(){
        performSegue(withIdentifier: "aguri", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "aguri"{
            let vc = segue.destination as! AgurimoaiViewController
            //vc.moji = setTime!
            print("値を渡したよ", hour, minute)
            vc.hour = hour
            vc.minute = minute
            vc.moji = textField.text

        }
    
}
        





}
