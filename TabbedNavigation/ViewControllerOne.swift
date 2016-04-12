//
//  ViewControllerOne.swift
//  TabbedNavigation
//
//  Created by Melissa Guba on 4/5/16.
//  Copyright © 2016 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerOneDelegate {
    func logoutActionPressedFromView(fromViewController: UIViewController)
}

public class ViewControllerOne : UIViewController {
    
    var delegate: ViewControllerOneDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.greenColor()
        tabBarItem = UITabBarItem(title: "One", image: UIImage(), tag: 0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewControllerOne.logoutAction(_:)))
    }
    
    // Actions
    
    func logoutAction(sender: UIBarButtonItem) {
        guard let delegate = delegate else { return }
        delegate.logoutActionPressedFromView(self)
    }
}
