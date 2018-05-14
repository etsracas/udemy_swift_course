//
//  ViewController.swift
//  SwiftImageView
//
//  Created by 米山諒 on 2018/05/08.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backImageView: UIImageView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        count = 1
    }

    @IBAction func changeImage(_ sender: Any) {
        
        if (count == 0) {
            backImageView.image = UIImage(named: "back1.jpg")
            count = 1
        } else if (count == 1) {
            backImageView.image = UIImage(named: "back2.jpg")
            count = 0
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

