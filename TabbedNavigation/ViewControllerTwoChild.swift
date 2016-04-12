//
//  ViewControllerTwoChild.swift
//  TabbedNavigation
//
//  Created by Melissa Guba on 4/12/16.
//  Copyright © 2016 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

public class ViewControllerTwoChild: UIViewController {
    
    convenience init(){
        self.init(nibName: nil, bundle: nil)
        
        hidesBottomBarWhenPushed = true
    }
    
}
