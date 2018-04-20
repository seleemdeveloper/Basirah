//
//  PlayerVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import AVFoundation
class PlayerVC: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        }
        catch
        {
            self.dismiss(animated: true, completion: nil)
        }
        
        audioPlayer.play()

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
