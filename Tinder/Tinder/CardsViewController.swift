//
//  CardsViewController.swift
//  Tinder
//
//  Created by Wenn Huang on 3/30/17.
//  Copyright © 2017 Wenn Huang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationBar = navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(named:"nav_bar" ), for: UIBarPosition(rawValue: 3)!, barMetrics: .default)
            //navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
            
            
        }
        photoImageView.isUserInteractionEnabled = true
        cardInitialCenter = photoImageView.center

    }

    @IBAction func onPanningImageView(_ sender: UIPanGestureRecognizer) {
       /* let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let centerX = location.x + translation.x
        let centerY = location.y + translation.y
        let viewWidth = view.frame.width*/
        
        
        //
        let viewWidth = view.frame.width
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: photoImageView)
        let touchStart = Date()
        var direction: Double = 1
        
        if(velocity.x < 0 && location.y > photoImageView.frame.midY) || (velocity.x
            > 0 && location.y < photoImageView.frame.midY) {
            direction = -1
        }
        
        if sender.state == .began {
            cardInitialCenter = CGPoint(x: photoImageView.frame.midX, y: photoImageView.frame.midY)
        } else if sender.state == .changed {
            let touchEnd = Date()
            let timeDelta: Double = touchEnd.timeIntervalSince(touchStart)
            let rotation = (0.1 / timeDelta < 0.99) ? 0.1 / timeDelta: 0.99
            
            photoImageView.transform = photoImageView.transform.translatedBy(x: translation.x, y: 0)
            photoImageView.transform = photoImageView.transform.rotated(by: CGFloat(direction * rotation * Double.pi / 180))
        } else if sender.state == .ended {
            if velocity.x > 50 {
                UIView.animate(withDuration: 0, animations: {
                    self.photoImageView.transform = self.photoImageView.transform.translatedBy(x: viewWidth, y: 0)
                }, completion: nil)
            } else if velocity.x < -50 {
                UIView.animate(withDuration: 0, animations: {
                    self.photoImageView.transform = self.photoImageView.transform.translatedBy(x: -1 * viewWidth, y: 0)
                }, completion: nil)
            } else {
                photoImageView.transform = CGAffineTransform.identity
            }
            
            photoImageView.transform = CGAffineTransform.identity
        }
           /* 
         if sender.state == .began {
            if centerX > cardInitialCenter.x && centerY < cardInitialCenter.y {
                photoImageView.transform = photoImageView.transform.rotated(by: CGFloat(45 * M_PI / 180))
            } else if centerX < cardInitialCenter.x && centerY < cardInitialCenter.y {
                photoImageView.transform = photoImageView.transform.rotated(by: CGFloat(315 * M_PI / 180))
            } else if centerX > cardInitialCenter.x && centerY > cardInitialCenter.y {
                photoImageView.transform = photoImageView.transform.rotated(by: CGFloat(315 * M_PI / 180))
            } else if centerX < cardInitialCenter.x && centerY > cardInitialCenter.y {
                photoImageView.transform = photoImageView.transform.rotated(by: CGFloat(45 * M_PI / 180))
            }
            
        }else if sender.state == .changed {
            
            
            photoImageView.center.x = location.x
            
        }else if sender.state == .ended {
            if velocity.x > 50 {
                UIView.animate(withDuration: 0, animations: {
                    self.photoImageView.transform = self.photoImageView.transform.translatedBy(x: viewWidth, y: 0)
                }, completion: nil)
            } else if velocity.x < -50 {
                UIView.animate(withDuration: 0, animations: {
                    self.photoImageView.transform = self.photoImageView.transform.translatedBy(x: -1 * viewWidth, y: 0)
                }, completion: nil)
            }else {
                photoImageView.transform = CGAffineTransform.identity
            }
            //photoImageView.center = cardInitialCenter
            //photoImageView.transform = .identity
            
        }*/
    }
        
    @IBAction func onTappingImage(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "photoPass", sender: UITapGestureRecognizer.self)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
        vc.image = photoImageView.image
    }
    

}
