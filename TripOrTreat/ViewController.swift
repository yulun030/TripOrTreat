//
//  ViewController.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/8/29.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController
{
    var _player:AVPlayer?
    var _playerItem:AVPlayerItem?
    var _playerLayer:AVPlayerLayer!
    let _videoView = UIView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        _videoView.frame = CGRect(x: 0, y: 0, width:super.view.frame.size.width, height: super.view.frame.size.height)
        self.view.addSubview(_videoView)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDone), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object:_player?.currentItem)
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(false)
//        loadVideo()
    }
    
    private func loadVideo()
    {
        // to prevent background music stop
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch  {}
        
        let videoPath = Bundle.main.path(forResource: "flyVideo", ofType: "mp4")
        
        _player = AVPlayer(url: URL(fileURLWithPath: videoPath!))
        
        _playerLayer = AVPlayerLayer(player: _player)
        
        _playerLayer.frame = view.bounds
        _playerLayer.videoGravity = .resize
        _videoView.layer.addSublayer(_playerLayer)
        
        self._player!.play()
    }
    
    func animate()
    {
        UIView.animate(withDuration: 1.5) {
            let Xsize = self.view.frame.size.width * 3
            let diffx = Xsize - self.view.frame.size.width
            let diffy = self.view.frame.size.height - Xsize
            self._playerLayer.frame = CGRect(x: -(diffx/2), y: diffy/2, width: Xsize, height: Xsize)
            self._videoView.alpha = 0.5
        }
        
        UIView.animate(withDuration: 1.5) {
            self._videoView.alpha = 0
        } completion: { done in
            if done {
                
            }
        }
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Home")
            newViewController.modalTransitionStyle = .crossDissolve
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    @objc private func playerDone()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2)
        {
            self.animate()
        }
    }
}

