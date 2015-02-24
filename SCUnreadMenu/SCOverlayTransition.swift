
import UIKit

class SCOverlayTransition : NSObject, UIViewControllerAnimatedTransitioning {
	var presenting = false
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
		return NSTimeInterval( 0.5 )
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		if let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) {
			if let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) {
				
				let fromView = fromViewController.view as UIView
				let toView = toViewController.view as UIView
				let containerView = transitionContext.containerView()
				let duration = self.transitionDuration(transitionContext)
				
				if presenting {
					fromView.userInteractionEnabled = false
					
					containerView.addSubview(toView)
					toView.alpha = 0
					
					UIView.animateWithDuration(duration, animations: { () -> Void in
						toView.alpha = 0.9
						}, completion: { (finished) -> Void in
							transitionContext.completeTransition( !transitionContext.transitionWasCancelled() )
					})
					
				} else {
					
					UIView.animateWithDuration(duration, animations: { () -> Void in
						fromView.alpha = 0.0
						toView.alpha = 1.0
						}, completion: { (finished) -> Void in
							fromView.removeFromSuperview()
							toView.userInteractionEnabled = true
							transitionContext.completeTransition( !transitionContext.transitionWasCancelled() )
					})
					
				}
			}
		}
	}

}
