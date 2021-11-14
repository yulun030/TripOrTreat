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
    private let logoImageView:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.addSubview(logoImageView)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        logoImageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5)
        {
            self.animate()
        }
    }
      
    private func animate()
    {
        UIView.animate(withDuration: 1)
        {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.logoImageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        }
        
        UIView.animate(withDuration: 1.5)
        {
            self.logoImageView.alpha = 0
        }
        completion:
        { done in
            if done
            {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3)
                {
                    let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController

                    tabBarController.modalTransitionStyle = .crossDissolve
                    tabBarController.modalPresentationStyle = .fullScreen
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = tabBarController
                    self.navigationController?.present(tabBarController, animated: true, completion: nil)
                }
            }
        }
    }
}

