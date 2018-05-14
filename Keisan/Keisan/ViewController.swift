//
//  ViewController.swift
//  Keisan
//
//  Created by 米山諒 on 2018/05/08.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var minus = 0
    var kakezan = 0
    var warizan = 0
    
    var ryo = "りょう"
    var yoneyama = "よねやま"
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        count = 10
        count = 11
        count = count + 1
        
        minus = 10
        minus = minus - 5
        
        kakezan = 10
        kakezan = kakezan * 10
        
        warizan = 10
        warizan = warizan / 2
        
        result = yoneyama + ryo
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

