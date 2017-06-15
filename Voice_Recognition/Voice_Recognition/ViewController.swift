//
//  ViewController.swift
//  Voice_Recognition
//
//  Created by Myeongjin kyeong on 2017. 6. 16..
//  Copyright © 2017년 Myeongjin kyeong. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var audioPlayer : AVAudioPlayer!
    
    @IBOutlet weak var textField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //앱 처음 실행시 
        //스피너 숨김 처리
        activitySpinner.isHidden = true
        
    }

    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.isHidden = true
        activitySpinner.stopAnimating()

    }
    
    @IBAction func playButton(_ sender: Any) {
    
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    
    
    
    }
    
    
    
    //목소리 인증
    func requestSpeechAuth(){
        SFSpeechRecognizer.requestAuthorization() { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a"){
                    do{
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    }catch{
                        print(error)
                    }
                
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request){ (result, error) in
                        if let error = error{
                            print(error)
                        }else{
                              self.textField.text = result?.bestTranscription.formattedString as! String
                        }
                        
                    }
                
                
                }
            }
            
        }
    }
//func 끝

}

