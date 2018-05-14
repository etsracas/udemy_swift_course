//
//  PreViewController.swift
//  Swift4SnapChatCamera
//
//  Created by 米山諒 on 2018/05/14.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class PreViewController: UIViewController {
    
    var image:UIImage?
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
    }

    @IBAction func save(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
