//
//  RequestsVC+Router.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
import AVKit
extension RequestsVC
{
    enum RequestsRouterDestinations
    {
        case updateRequest(request: Request)
        case newRequest
        case player(url: String)
    }
    
    func route(to destination: RequestsRouterDestinations)
    {
        
        switch destination
        {
        case .newRequest:
            let newRequestVC = NewRequestVC(nibName: "NewRequestVC", bundle: nil)
            self.present(newRequestVC, animated: true, completion: nil)
            
        case .updateRequest(let request):
            let updateRequestVC = UpdateRequestVC(nibName: "UpdateRequestVC", bundle: nil)
            updateRequestVC.request = request
            self.present(updateRequestVC, animated: true, completion: nil)
        
        case .player(let url):
            let playerController = AVPlayerViewController()
            let audioPlayer =  AVPlayer(url: URL(string: url)!)
            playerController.player = audioPlayer
            self.present(playerController, animated: true, completion: nil)
            
        }
    }
    
    
}
