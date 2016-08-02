//
//  MenuTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
//    var tableView: UITableView {
//        get {
//            return view as! UITableView
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let imageView = UIImageView(image: UIImage(named: "viewBgr"))
//        tableView.backgroundView = imageView
    }
}

extension MenuTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MenuCell.cellIdentifier, forIndexPath: indexPath) as! MenuCell
        cell.item = Menu(rawValue: indexPath.row)
        return cell
    }
}

extension MenuTableViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Menu.menuSegue(item: Menu(rawValue: indexPath.row)!) != nil {
            self.performSegueWithIdentifier(Menu.menuSegue(item: Menu(rawValue: indexPath.row)!)!, sender: self)
        }
    }
}
