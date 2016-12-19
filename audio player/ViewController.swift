//
//  ViewController.swift
//  audio player
//
//  Created by Animesh Manglik on 12/19/16.
//  Copyright © 2016 Animesh Manglik. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    var timer = Timer()
    
    internal func updatePlayBar() {
        playBar.value = Float(player.currentTime)
    }
    
    @IBAction func playButton(_ sender: AnyObject) {
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updatePlayBar), userInfo: nil, repeats: true)

    }
    
    @IBAction func pauseButton(_ sender: AnyObject) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stopButton(_ sender: AnyObject) {
        playBar.value = 0
        timer.invalidate()
        player.pause()
        player.currentTime = 0
    }
    
    @IBOutlet weak var playBar: UISlider!
    
    @IBAction func playBarSlider(_ sender: AnyObject) {
    
        player.currentTime = TimeInterval(playBar.value)
        
    }
    
    @IBOutlet weak var volumeBar: UISlider!
    
    @IBAction func volumeBarSlider(_ sender: AnyObject) {
        
        player.volume = volumeBar.value
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "bach_sheep", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            playBar.maximumValue = Float(player.duration)
        } catch {
            
            // Print any errors
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

