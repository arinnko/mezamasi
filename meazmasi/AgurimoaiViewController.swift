
//
//  AgurimoaiViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/02/09.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import UserNotifications

class AgurimoaiViewController: UIViewController {
    
    @IBOutlet var timeTextField:UITextField?
    @IBOutlet var nowTimeLabel: UILabel!
    var utility = Utility()
    
    var moji: String!
    
//    var time = setTime!
    
    var hour:Int!
    var minute:Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nowTimeLabel.text = utility.nowTimeGet()
        print("設定した時間は、", hour, minute)
        tuchi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        //↓画面戻るコード
        dismiss(animated: true, completion: nil)
    }
    

    func tuchi(){
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "It's time!"
        content.sound = UNNotificationSound.default()
        
        // UNCalendarNotificationTrigger 作成
        let date = DateComponents(hour:hour, minute:minute)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
        
        // id, content, trigger から UNNotificationRequest 作成
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger)
        
        // UNUserNotificationCenter に request を追加
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound], completionHandler: {
            (error) in
        })
        center.add(request)
        print("setup tuchi")
    }

}
class Utility {
    // 現在時刻を"yyyy/MM/dd HH:mm:ss"のString型で返すクラスメソッド
    func nowTimeGet() -> String {
        // 現在時刻を取得
        let now = NSDate()
        let formatter = DateFormatter()
        // 好きなフォーマットを設定する
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let str = formatter.string(from: now as Date)
        return str
    }
}

