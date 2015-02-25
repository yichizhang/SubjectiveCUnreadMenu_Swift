//
//  SCSpringExpandView.swift
//  SCUnreadMenu
//
//  Created by Yichi on 25/02/2015.
//  Copyright (c) 2015 Subjective-C. All rights reserved.
//

import Foundation
import UIKit

class SCSpringExpandView : UIView {
	
	private var stretchingView = UIView()
	private var expanded = false
	
	var frameForCollapsedState:CGRect {
		return CGRect(x: 0, y: bounds.midY - bounds.width / 2, width: bounds.width, height: bounds.width)
	}
	
	var frameForExpandedState:CGRect {
		return CGRect(x: bounds.width / 4, y: 0, width: bounds.width / 2, height: bounds.height)
	}
	
	// MARK: Init
	func commonInit() {
		stretchingView.backgroundColor = UIColor.grayColor()
		addSubview(stretchingView)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	// MARK: Overriden methods
	override func layoutSubviews() {
		super.layoutSubviews()
		
		configureViewsForExpandedState(self.expanded, animated: false)
		stretchingView.layer.cornerRadius = stretchingView.bounds.midX
	}
	
	// MARK: Public methods
	func setColor(color:UIColor) {
		stretchingView.backgroundColor = color
	}
	
	func setExpanded(expanded:Bool, animated:Bool) {
		if self.expanded != expanded {
			self.configureViewsForExpandedState(expanded, animated: animated)
		}
	}
	
	// MARK: Private Methods
	private func configureViewsForExpandedState(expanded:Bool, animated:Bool) {
		if expanded {
			self.expand(animated: animated)
		} else {
			self.collapse(animated: animated)
		}
	}
	
	private func expand(#animated:Bool) {
		let expandBlock = { () -> Void in
			self.stretchingView.frame = self.frameForExpandedState
			self.expanded = true
		}
		
		if animated {
			performBlockInAnimation(expandBlock)
		} else {
			expandBlock()
		}
	}
	
	private func collapse(#animated:Bool) {
		let collapseBlock = { () -> Void in
			self.stretchingView.frame = self.frameForCollapsedState
			self.expanded = false
		}
		
		if animated {
			performBlockInAnimation(collapseBlock)
		} else {
			collapseBlock()
		}
	}
	
	private func performBlockInAnimation(blockToAnimate:(() -> Void) ) {
		UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: .BeginFromCurrentState, animations: blockToAnimate, completion: nil)
	}
	
}