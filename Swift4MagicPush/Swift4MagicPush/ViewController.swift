//
//  ViewController.swift
//  Swift4MagicPush
//
//  Created by 米山諒 on 2018/05/12.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var honbunTextField: UITextField!
    
    let timerNotificationIdentifier = "id1"
    
    var resultString = ""
    var ketsugouString = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        honbunTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 名前と本文に記入された文字をつなげる
        resultString = nameTextField.text! + ketsugouString + honbunTextField.text!
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    func startPush() {
        // ５秒後にpush通知を行う
        //通知許可
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if(settings.authorizationStatus == .authorized){
                //　知らせる
                self.push()
            } else {
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: { (granted, error) in
                    
                    if let error = error {
                        print(error)
                    } else {
                        if(granted) {
                            self.push()
                        }
                    }
                })
            }
        }
        
    }
    
    func push() {
        // テキストフィールドの中にある文字をセットする
        let content = UNMutableNotificationContent()
        content.title = nameTextField.text!
        content.subtitle = honbunTextField.text!
        
        let timerIconURL = Bundle.main.url(forResource: "sunrise", withExtension: "jpg")
        let attach = try! UNNotificationAttachment(identifier: timerNotificationIdentifier, url: timerIconURL!, options: nil)
        
        content.attachments.append(attach)
        
        // ５秒後に送信する
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: timerNotificationIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            // エラー処理
            if let error = error{
                print (error)
            } else {
                print("配信されました")
            }
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        startPush()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

