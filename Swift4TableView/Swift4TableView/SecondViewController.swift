//
//  SecondViewController.swift
//  Swift4TableView
//
//  Created by 米山諒 on 2018/05/10.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var box = String()
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = box
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
