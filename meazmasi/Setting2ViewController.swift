//
//  SettingViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2017/01/19.
//  Copyright © 2017年 山本有紗. All rights reserved.
//

import UIKit
import UserNotifications

class Setting2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func back(){
        //↓画面戻るコード
        dismiss(animated: true, completion: nil)
    
    }
    

    override func viewWillAppear(_ animated: Bool) {
        var backgroundnumber:Int!
        let userDefaults = UserDefaults.standard
        backgroundnumber = userDefaults.integer(forKey: "background")
        if backgroundnumber == 1{
            apuri5ImageView.image = UIImage(named: "apuri20")
        }
        
        if backgroundnumber == 2{
            apuri5ImageView.image = UIImage(named:"apuri5")
        }
        
        

        
    }
    @IBAction func buletap(){
        apuri5ImageView.image  = UIImage(named: "apuri5")
        
        UserDefaults.standard.set(2, forKey: "background")
    }
    
    @IBOutlet var apuri5ImageView: UIImageView!
    
    @IBAction func redtap(){
        apuri5ImageView.image  = UIImage(named: "apuri20")
        
        UserDefaults.standard.set(1, forKey: "background")
    }
    
    
     
    
    }








