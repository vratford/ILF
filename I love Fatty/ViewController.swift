//
//  ViewController.swift
//  I love Fatty
//
//  Created by Vincent Ratford on 11/27/17.
//  Copyright © 2017 Vincent Ratford. All rights reserved.
//

import UIKit
import AVFoundation //Adds audio toolbox library

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var soundArray = ["note1","note2","note3","note4","note5","note6","note7","All Shook Up Short","Dreamweaver","What Do You Do for Money Honey short","Back in Black short","Baba O'Riley short"]
    
    var audioPlayer : AVAudioPlayer!
    var soundFileName = ""
    
    
    var randomPict : Int = 0
    var randomSound : Int = 0
    
    let pictArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","196","197","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235"]
    
    
    
    
    @IBOutlet weak var pictImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updatePictImage()
        
        playSound(soundFileName: soundArray[7])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func buttonButtonPressed(_ sender: UIButton) {
        
        randomSound = Int(arc4random_uniform(11))
//        print(randomSound)
        
        updatePictImage()
        
        playSound(soundFileName: soundArray[randomSound])

        
    }
    func updatePictImage() {
        
        randomPict = Int(arc4random_uniform(175))

        
        pictImageView.image = UIImage(named: pictArray[randomPict])
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updatePictImage()
    }
    
    func playSound(soundFileName: String) {
        
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
            
//                        guard let player = player else { return }
//            
//                        player.prepareToPlay()
//                        player.play();
        }
            
        catch {
            print(error)
        }
        
        audioPlayer.play()
        
    }
}

