//
//  MainNavigationContainerViewController.swift
//  TabbedNavigation
//
//  Created by Melissa Guba on 3/21/16.
//  Copyright © 2016 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

public class MainNavigationContainerViewController: UIViewController, UITabBarControllerDelegate {
    
    // Outlets
    
    var mainNavigationTabBarController: UITabBarController?
    
    // Properties
    
    var navigationControllerOne: UINavigationController?
    var navigationControllerTwo: UINavigationController?
    var navigationControllerThree: UINavigationController?
    var rawViewController: UIViewController?
    var modalViewControllerOne: UIViewController?
    
    
    // Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTabBarController()
        
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        modalViewControllerOne = storyboard.instantiateInitialViewController()
    }
    
    // Configuration
    
    func initializeTabBarController() {
        let viewControllerOne = ViewControllerOne()
        viewControllerOne.delegate = self
        navigationControllerOne = UINavigationController(rootViewController: viewControllerOne)
        
        let viewControllerTwo = ViewControllerTwo()
        navigationControllerTwo = UINavigationController(rootViewController: viewControllerTwo)
        
        let viewControllerThree = ViewControllerThree()
        navigationControllerThree = UINavigationController(rootViewController: viewControllerThree)
        
        rawViewController = UIViewController()
        rawViewController?.view.backgroundColor = UIColor.redColor()
        rawViewController?.tabBarItem = UITabBarItem(title: "Raw", image: UIImage(), tag: 1)
        
        let viewControllers = [navigationControllerOne!, navigationControllerTwo!, navigationControllerThree!, rawViewController!]
        
        mainNavigationTabBarController?.setViewControllers(viewControllers, animated: false)
        mainNavigationTabBarController?.selectedIndex = 0
    }
    
    // Segue
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "embedTabBarController") {
            mainNavigationTabBarController = segue.destinationViewController as? UITabBarController
            mainNavigationTabBarController?.delegate = self
        }
        
        super.prepareForSegue(segue, sender: sender)
    }
    
}

extension MainNavigationContainerViewController: ViewControllerOneDelegate {
    
    // ViewControllerOneDelegate
    
    func logoutActionPressedFromView(fromViewController: UIViewController) {
        guard let modal = modalViewControllerOne else { return }
        
        presentViewController(modal, animated: true) { () -> Void in
            //finished stuff
        }
    }
}
