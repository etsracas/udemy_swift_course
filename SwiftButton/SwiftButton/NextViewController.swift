//
//  NextViewController.swift
//  SwiftButton
//
//  Created by 米山諒 on 2018/05/07.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func change(_ sender: Any) {
        changeLabel.text = "暗号が解除されました。"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
