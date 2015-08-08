//
//  MainNavigationController.swift
//  slideout
//
//  Created by Dennis Suratna on 8/8/15.
//  Copyright (c) 2015 Dennis Suratna. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    private var mainSelectedObserver: NSObjectProtocol?
    private var redSelectedObserver: NSObjectProtocol?
    private var greenSelectedObserver: NSObjectProtocol?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    private func addObservers() {
        let center = NSNotificationCenter.defaultCenter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        mainSelectedObserver = center.addObserverForName(MenuViewController.Notifications.MainSelected, object: nil, queue: nil) { (notification: NSNotification!) in
            let mvc = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! UIViewController
            self.setViewControllers([mvc], animated: true)
        }
        
        redSelectedObserver = center.addObserverForName(MenuViewController.Notifications.RedSelected, object: nil, queue: nil) { (notification: NSNotification!) in
            let rvc = storyboard.instantiateViewControllerWithIdentifier("RedViewController") as! UIViewController
            self.setViewControllers([rvc], animated: true)
        }
        
        greenSelectedObserver = center.addObserverForName(MenuViewController.Notifications.GreenSelected, object: nil, queue: nil) { (notification: NSNotification!) in
            let gvc = storyboard.instantiateViewControllerWithIdentifier("GreenViewController") as! UIViewController
            self.setViewControllers([gvc], animated: true)
        }
    }
    
    private func removeObservers(){
        let center = NSNotificationCenter.defaultCenter()
        
        if mainSelectedObserver !=  nil {
            center.removeObserver(mainSelectedObserver!)
        }
        if redSelectedObserver != nil {
            center.removeObserver(redSelectedObserver!)
        }
        if greenSelectedObserver != nil {
            center.removeObserver(greenSelectedObserver!)
        }
    }

}
