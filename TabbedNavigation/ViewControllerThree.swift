//
//  ViewControllerThree.swift
//  TabbedNavigation
//
//  Created by Melissa Guba on 4/13/16.
//  Copyright © 2016 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

// Note: UICollectionViewDelegateFlowLayout: UICollectionViewDelegate, UIScrollView
public class ViewControllerThree: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var items: [String] = ["tacos", "tequila", "whiskey", "a", "b", "c", "a", "b", "c", "a", "b", "c"]
    var colors: [UIColor] = [UIColor.greenColor(), UIColor.lightGrayColor(), UIColor.brownColor(),UIColor.greenColor(), UIColor.lightGrayColor(), UIColor.brownColor(),UIColor.greenColor(), UIColor.lightGrayColor(), UIColor.brownColor(),UIColor.greenColor(), UIColor.lightGrayColor(), UIColor.brownColor() ]
    
    convenience init(){
        self.init(nibName: nil, bundle: nil)
        
        title = "Mock Feed"
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        instantiateCollectionView()
    }
    
    func instantiateCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 10)
        layout.itemSize = CGSize(width: 150, height: 150)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
    }
    
    // UICollectionViewDataSource
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    // UICollectionViewDelegate
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewController = UIViewController()
        viewController.title = items[indexPath.item]
        viewController.view.backgroundColor = colors[indexPath.item]
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
