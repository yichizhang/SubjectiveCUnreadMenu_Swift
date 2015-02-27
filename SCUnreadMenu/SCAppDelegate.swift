//
//  SCAppDelegate.swift
//  SCUnreadMenu
//
//  Created by Yichi on 27/02/2015.
//  Copyright (c) 2015 Subjective-C. All rights reserved.
//

import UIKit

@UIApplicationMain @objc
class SCAppDelegate : UIResponder, UIApplicationDelegate {
	lazy var window:UIWindow = {
		let window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window.rootViewController = self.rootViewController
		return window
	}()
	lazy var rootViewController:SCRootViewController = {
		return SCRootViewController(nibName: nil, bundle: nil)
	}()
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
		
		self.window.makeKeyAndVisible()
		return true
	}
}