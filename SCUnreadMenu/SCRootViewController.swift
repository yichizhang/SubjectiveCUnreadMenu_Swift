//
//  SCRootViewController.swift
//  SCUnreadMenu
//
//  Created by Yichi on 27/02/2015.
//  Copyright (c) 2015 Subjective-C. All rights reserved.
//

import Foundation
import UIKit

class SCRootViewController : UIViewController, UIScrollViewDelegate, UIViewControllerTransitioningDelegate {
	
	lazy var enclosingScrollView:UIScrollView = {
		let scrollView = UIScrollView(frame: self.view.bounds)
		scrollView.alwaysBounceHorizontal = true
		scrollView.decelerationRate = UIScrollViewDecelerationRateFast
		scrollView.delegate = self
		return scrollView
	}()
	lazy var textView:UITextView = {
		let textView = UITextView(frame: self.view.bounds, textContainer: nil)
		textView.textContainerInset = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
		textView.font = UIFont(name: "AvenirNext-Regular", size: 16)
		textView.textColor = UIColor.darkGrayColor()
		textView.editable = false
		return textView
	}()
	
	lazy var menuViewController:SCMenuViewController = {
		let viewController = SCMenuViewController(nibName: nil, bundle: nil)
		viewController.transitioningDelegate = self
		viewController.modalPresentationStyle = .Custom
		return viewController
	}()
	lazy var menuDragAffordanceView:SCDragAffordanceView = {
		let affordanceView = SCDragAffordanceView(frame: CGRect(x: self.enclosingScrollView.bounds.maxX + 10, y: self.enclosingScrollView.bounds.midY, width: 50, height: 50))
		return affordanceView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.whiteColor()
		view.addSubview(enclosingScrollView)
		enclosingScrollView.addSubview(textView)
		enclosingScrollView.addSubview(menuDragAffordanceView)
		
		if let contentPlistPath = NSBundle.mainBundle().pathForResource("ArticleContent", ofType: "plist") {
			if let contentDictionary = NSDictionary(contentsOfFile: contentPlistPath) {
				textView.text = contentDictionary.valueForKey("body") as String
			}
		}
	}
	
	// MARK: UIScrollViewDelegate
	func scrollViewDidScroll(scrollView: UIScrollView) {
		if scrollView.dragging {
			menuDragAffordanceView.progress = scrollView.contentOffset.x / menuDragAffordanceView.bounds.width
		}
	}
	
	func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		if menuDragAffordanceView.progress >= 1 {
			presentViewController(menuViewController, animated: true, completion: nil)
		} else {
			menuDragAffordanceView.progress = 0
		}
	}
	
	// MARK: UIViewControllerTransitioningDelegate
	func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		let t = SCOverlayTransition()
		t.presenting = true
		return t
	}
	
	func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		let t = SCOverlayTransition()
		t.presenting = false
		return t
	}
}
