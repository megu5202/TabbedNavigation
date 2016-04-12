//
//  ViewControllerTwo.swift
//  TabbedNavigation
//
//  Created by Melissa Guba on 4/12/16.
//  Copyright © 2016 Melissa Guba. All rights reserved.
//

// NOTE: This file is going to be a mock of the SpacesList in the Gloo app - so I must set it up the same

import Foundation
import UIKit

public class ViewControllerTwo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
    
    var items: [String] = ["cheese", "muffin", "toast"]
    var colors: [UIColor] = [UIColor.purpleColor(), UIColor.blueColor(), UIColor.cyanColor()]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
        title = "Mock Spaces"
        tabBarItem = UITabBarItem(title: "Two", image: UIImage(), tag: 1)
        
        tableView.frame = CGRect(x: 0, y: 0, width: 320, height: 300)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    //UITableViewDataSource
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!  as UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    // UITableViewDelegate
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = ViewControllerTwoChild()
        viewController.title = items[indexPath.row]
        viewController.view.backgroundColor = colors[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}