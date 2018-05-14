//
//  AddViewController.swift
//  Swift4TodoApp
//
//  Created by 米山諒 on 2018/05/12.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        
        // 現在の配列の状況を取り出す
        if UserDefaults.standard.object(forKey: "array") != nil {
            array = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        // textFieldで記入されたテキストを配列に入れて、
        array.append(textField.text!)
        
        // 配列をアプリ内に保存する
        UserDefaults.standard.set(array, forKey: "array")
        
        // 画面を戻る
        self.navigationController?.popViewController(animated: true)
        
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
