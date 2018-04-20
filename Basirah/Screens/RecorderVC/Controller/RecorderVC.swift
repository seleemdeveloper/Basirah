//
//  RecorderVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import AVFoundation

class RecorderVC: UIViewController {

    @IBOutlet weak var uploadingIndicatorLabel: UILabel!
    @IBOutlet weak var recorderImgView: UIImageView!
    
    
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var recorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disablePlayButton()
        disableClearButton()
        disableFinishButton()
        
        do
        {
          try prepareRecorder()
        }
        catch
        {
            self.dismiss(animated: true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordPauseButtonDidTouched(_ sender: UIButton)
    {
        guard let recorder = recorder else {return}
        if recorder.isRecording
        {
            recorder.pause()
            recorderImgView.image = #imageLiteral(resourceName: "recorder-icon")
            
        }
        else
        {
            recorder.record()
            recorderImgView.image = #imageLiteral(resourceName: "pause-icon")
            enableFinishButton()
            enablePlayButton()
            enableClearButton()
        }
    }
    
    @IBAction func playButtonDidTouched(_ sender: UIButton)
    {
        recorder.stop()
        
        //todo: call player
    }
    
    @IBAction func finishRecordingButtonDidTOuched(_ sender: UIButton)
    {
        recorder.stop()
        disableClearButton()
        disablePlayButton()
    }
    
    @IBAction func resetButtonDidTouched(_ sender: UIButton)
    {
        recorder.stop()
        recorder = nil
        do
        {
            try prepareRecorder()
        }
        catch
        {
            self.dismiss(animated: true, completion: nil)
        }
        
        disableFinishButton()
        disableClearButton()
        disablePlayButton()
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    func prepareRecorder() throws
    {
        do {
            
            var audioURL = getDocumentsDirectory()
            audioURL.appendPathComponent("/audio.m4a")
            
            let recordSettings = [AVSampleRateKey : NSNumber(value: Float(44100) as Float),
                                  AVFormatIDKey : NSNumber(value: Int32(kAudioFormatMPEG4AAC) as Int32),
                                  AVNumberOfChannelsKey : NSNumber(value: 1 as Int32),
                                  AVEncoderAudioQualityKey : NSNumber(value: Int32(AVAudioQuality.high.rawValue) as Int32)]
            
            recorder = try AVAudioRecorder(url: audioURL, settings: recordSettings)
            recorder?.prepareToRecord()
            
        }
        catch  {
            throw error
        }
    }
    
    @IBAction func dismissButtonDidTouched(_ sender: UIButton)
    {
        recorder.stop()
        recorder = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func enableFinishButton()
    {
        finishButton.alpha = 1
        finishButton.isEnabled = true
    }
    
    func disableFinishButton()
    {
        finishButton.alpha = 0.5
        finishButton.isEnabled = false
    }
    
    func enableClearButton()
    {
        resetButton.alpha = 1
        resetButton.isEnabled = true
    }
    
    func disableClearButton()
    {
        resetButton.alpha = 0.5
        resetButton.isEnabled = false
    }
    
    func enablePlayButton()
    {
        playButton.alpha = 1
        playButton.isEnabled = true
    }
    
    func disablePlayButton()
    {
        playButton.alpha = 0.5
        playButton.isEnabled = false
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
