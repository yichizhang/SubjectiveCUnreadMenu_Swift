//
//  SCMenuViewController.swift
//  SCUnreadMenu
//
//  Created by Yichi on 27/02/2015.
//  Copyright (c) 2015 Subjective-C. All rights reserved.
//

import UIKit

class SCMenuViewController: UIViewController {
	
	lazy var tapGestureRecognizer:UITapGestureRecognizer = {
		let recognizer = UITapGestureRecognizer(target: self, action: "tapGestureRecognized:")
		return recognizer
		}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		view.backgroundColor = UIColor.whiteColor()
		
		let menuLabel = UILabel(frame: CGRectZero)
		menuLabel.text = NSLocalizedString("Menu", comment: "Menu title")
		menuLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
		
		menuLabel.sizeToFit()
		menuLabel.frame = CGRect(x: view.bounds.midX - menuLabel.bounds.midX, y: view.bounds.midY - menuLabel.bounds.midY, width: menuLabel.bounds.width, height: menuLabel.bounds.height).integerRect
		
		view.addSubview(menuLabel)
		
		let tapToCloseLabel = UILabel(frame: CGRectZero)
		tapToCloseLabel.text = NSLocalizedString("Tap to close", comment: "Menu tap to close text")
		
		tapToCloseLabel.sizeToFit()
		tapToCloseLabel.frame = CGRect(x: view.bounds.midX - tapToCloseLabel.bounds.midX, y: menuLabel.frame.maxY, width: tapToCloseLabel.bounds.width, height: tapToCloseLabel.bounds.height).integerRect
		
		view.addSubview(tapToCloseLabel)
		
		view.addGestureRecognizer(tapGestureRecognizer)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tapGestureRecognized(tapGestureRecognizer:UITapGestureRecognizer) {
		presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
	}
	
}
