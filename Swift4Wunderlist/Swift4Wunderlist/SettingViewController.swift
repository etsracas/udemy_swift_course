//
//  SettingViewController.swift
//  Swift4Wunderlist
//
//  Created by 米山諒 on 2018/05/17.
//  Copyright © 2018年 米山諒. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var sv: UIScrollView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var vc = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vc.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
        
        for i in 0..<10 {
            let button:UIButton = UIButton()
            button.tag = i
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            let buttonImage:UIImage = UIImage(named: String(i) + ".jpg")!
            button.setImage(buttonImage, for: .normal)
            button.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
            vc.addSubview(button)
        }
        
        sv.addSubview(vc)
        sv.contentSize = vc.bounds.size
    }
    
    @objc func selectImage(sender:UIButton) {
        // 画像をUIImageViewに反映する
        backImageView.image = UIImage(named: String(sender.tag) + ".jpg")
        
        // Buttonのタグ情報をアプリ内へ保存
        UserDefaults.standard.set(String(sender.tag), forKey: "image")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
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
