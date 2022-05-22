//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

enum TabIndex: Int {
    case firstChildTab = 0
    case secondChildTab = 1
}

class SegmentWithViewController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    lazy var pinkVC: PinkViewController = {
        let vc = PinkViewController()
        return vc
    }()
    
    lazy var greenVC: GreenViewController = {
        let vc = GreenViewController()
        return vc
    }()
    
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
    }
   
    @IBAction func switchTab(_ sender: UISegmentedControl) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = self.containerView.bounds
            self.containerView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController?{
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue:
            vc = pinkVC
        case TabIndex.secondChildTab.rawValue:
            vc = greenVC
        default:
        return nil
        }
        
        return vc
    }
}
