//
//  MenuTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {

    var tableView: UITableView {
        get {
            return view as! UITableView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "viewBgr")
        let imageView = UIImageView(image: backgroundImage)
        tableView.backgroundView = imageView
    }
}

extension MenuTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.menuItem, forIndexPath: indexPath) as! MenuTableViewCell
        if let menuItem = Menu(rawValue: indexPath.row) {
            cell.item = menuItem
        }
                
        return cell
    }
}

extension MenuTableViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let item = Menu(rawValue: indexPath.row) {
            switch item {
            case .storeSetup:
                self.performSegueWithIdentifier(Constant.storeSetup, sender: self)
            default:
                break
            }
        }
    }
}
