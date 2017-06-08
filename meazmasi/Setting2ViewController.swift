//
//  Setting2ViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/02/09.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import UserNotifications

class Setting2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    let userDefaults = UserDefaults.standard
    let now = NSDate()
    @IBOutlet var textField:UITextField!
    
    
    
    @IBAction func changeDate(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        print(formatter.string(from: sender.date))
        
        
        
        print("aaaaa")
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: sender.date)
        let hour = calendar.component(.hour, from: sender.date)
        let minute = calendar.component(.minute, from: sender.date)
    }
    
    
    //最初に呼ばれるとこ
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.datePickerMode = .time
        
        self.view.addSubview(datePicker)
        
        datePicker.minuteInterval = 5
//        datePicker.addTarget(self, action: #selector(updatePickerValue(sender:)), for: .v)
        
        textField.delegate = self

        
        if let labelText = userDefaults.string(forKey:"nameLabel") {
            nameLabel.text = labelText
        }
        
    
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
        let setTime = datePicker.date
        let nowTime = Date()
        let dif = setTime.timeIntervalSince(nowTime)
        print(dif)
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

    
    func tuchi(){
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "It's time!"
        content.sound = UNNotificationSound.default()
        
        // UNCalendarNotificationTrigger 作成
        let date = DateComponents(hour:20, minute:1)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
        
        // id, content, trigger から UNNotificationRequest 作成
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger)
        
        // UNUserNotificationCenter に request を追加
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound], completionHandler: {
            (error) in
        })
        center.add(request)
        
    }
    
    @IBAction func tapButton(){
    
    }
        


}
