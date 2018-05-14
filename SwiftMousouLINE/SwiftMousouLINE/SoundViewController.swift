//
//  SoundViewController.swift
//  SwiftMousouLINE
//
//  Created by 米山諒 on 2018/05/10.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLavel: UILabel!
    
    @IBOutlet var imaeView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // はじめは非表示にしておく
        imaeView2.isHidden = true
        
        // timeLavelを非表示にする
        timeLavel.isHidden = true
        
        // 音声を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer (contentsOf: url)
                audioPlayer?.play()
            } catch{
                // プレイヤー作成失敗
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func tap(_ sender: Any) {
        // imageView2を表示させる
        imaeView2.isHidden = false
        
        // timeLavelを表示にする
        timeLavel.isHidden = false
        
        // タイマーをスタートさせてtimeLavelを更新する
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountUp), userInfo: nil, repeats: true)
        
        // baby.mp3を再生する
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer (contentsOf: url)
                audioPlayer?.play()
            } catch{
                // プレイヤー作成失敗
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil")
        }
    }
    
    @objc func timerCountUp() {
        count = count + 1
        timeLavel.text = String(count)
    }
    
    @IBAction func deny(_ sender: Any) {
        
        // 電話を切る
        
        // 音声を止める
        audioPlayer.stop()
        
        // 画面をトップに戻す
        dismiss(animated: true, completion: nil)
        
    }
    

}
