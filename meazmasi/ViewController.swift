//
//  ViewController.swift
//  meazmasi
//
//  Created by 山本有紗 on 2016/11/17.
//  Copyright © 2016年 山本有紗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("最初")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func tapButton(){
        performSegue(withIdentifier: "toSetting", sender: nil)
    }


    


}

