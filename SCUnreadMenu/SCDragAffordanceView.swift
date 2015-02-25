//
//  SCDragAffordanceView.swift
//  SCUnreadMenu
//
//  Created by Yichi on 26/02/2015.
//  Copyright (c) 2015 Subjective-C. All rights reserved.
//

import Foundation
import UIKit

class SCDragAffordanceView : UIView {
	var _progress = CGFloat(0)
	var progress:CGFloat {
		set {
			_progress = newValue
			
			let progressInterval = 1 / CGFloat(springExpandViews.count)
			
			for (index, springExpandView) in enumerate(springExpandViews) {
				let expanded = ( CGFloat(index+1) * progressInterval < progress )
				
				if progress >= 1 {
					springExpandView.setColor(UIColor.redColor())
				} else if expanded {
					springExpandView.setColor(UIColor.blackColor())
				} else {
					springExpandView.setColor(UIColor.grayColor())
				}
				
				springExpandView.setExpanded(expanded, animated: true)
			}
			
		}
		get {
			return _progress
		}
	}
	private var springExpandViews:[SCSpringExpandView] = Array()
	
	// MARK: Init
	func commonInit() {
		for _ in 0..<3 {
			let springExpandView = SCSpringExpandView(frame: CGRectZero)
			addSubview(springExpandView)
			springExpandViews.append(springExpandView)
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	// MARK: Layout subviews
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let interItemSpace = bounds.width / CGFloat(springExpandViews.count)
		
		for (index, springExpandView) in enumerate(springExpandViews) {
			springExpandView.frame = CGRect(x: interItemSpace * CGFloat(index), y: 0, width: 4, height: bounds.height)
		}
	}
}