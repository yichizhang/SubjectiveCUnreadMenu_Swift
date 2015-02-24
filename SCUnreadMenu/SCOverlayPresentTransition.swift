
import UIKit

class SCOverlayPresentTransition : NSObject, UIViewControllerAnimatedTransitioning {
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
		return NSTimeInterval( 0.5 )
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		// Pitfall
		// Typed "UITransitionContextFromViewKey", didn't work.
		if let presentingViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) {
			if let overlayViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) {
		
				let containerView = transitionContext.containerView()
				containerView.addSubview(presentingViewController.view)
				containerView.addSubview(overlayViewController.view)
				
				overlayViewController.view.alpha = 0
				
				// Swift 1.1
				// If I type "let transitionDuration = transitionDuration(transitionContext)"
				// would not work.
				let transitionDuration = self.transitionDuration(transitionContext)
				UIView.animateWithDuration(transitionDuration, animations: { () -> Void in
					overlayViewController.view.alpha = 0.9
				}, completion: { (finished) -> Void in
					let transitionWasCancelled = transitionContext.transitionWasCancelled()
					let didComplete = (transitionWasCancelled == false)
					transitionContext.completeTransition(didComplete)
				})
			}
		}
	}
}
