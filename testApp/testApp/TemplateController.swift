//
//  TemplateController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/3/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class TemplateController: UIViewController {
    
    private var backgroundImage: UIImage? {
        didSet {
            UIGraphicsBeginImageContext(self.view.frame.size)
            backgroundImage!.drawInRect(self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = UIImage(named: "viewBgr")
        configurationView()
    }
    
    private func configurationView() {
       
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bottomBar"), forBarPosition: .Any, barMetrics: .Default)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        navigationController?.navigationItem.backBarButtonItem?.setBackgroundImage(UIImage(named: "rightItem"), forState: .Normal, barMetrics: .Default)
        
    }
}
