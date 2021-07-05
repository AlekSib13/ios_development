//
//  LoadingPageViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 05.07.2021.
//

import UIKit

class InitialCover: UIViewController {

    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var VKTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backGroundView.backgroundColor = #colorLiteral(red: 0.1722629964, green: 0.5988544822, blue: 0.9722792506, alpha: 1)
        VKTextLabel.text = "VK"
        VKTextLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        VKTextLabel.font = UIFont(name: "Arial-BoldMT", size: 32.0)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        performSegue(withIdentifier: "ToVKLoginScene", sender: nil)
    }

}
