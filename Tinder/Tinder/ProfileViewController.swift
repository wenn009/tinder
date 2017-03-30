//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Wenn Huang on 3/30/17.
//  Copyright © 2017 Wenn Huang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var image : UIImage!
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationBar = navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(named: "nav_bar2" ), for: UIBarPosition(rawValue: 3)!, barMetrics: .default)
            
        photoImageView.image = image 
        }
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
