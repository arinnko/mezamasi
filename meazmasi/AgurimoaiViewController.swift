
//
//  AgurimoaiViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/02/09.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit

class AgurimoaiViewController: UIViewController {
    
    @IBOutlet var timeTextField:UITextField?
    @IBOutlet var nowTimeLabel: UILabel!
    var utility = Utility()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nowTimeLabel.text = utility.nowTimeGet()

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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

