//
//  Animation.swift
//  SOSideMenu
//
//  Created by Hitesh on 11/16/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class Animation: NSObject, UIViewControllerAnimatedTransitioning {

    let isPresenting :Bool
    let duration :TimeInterval = 0.5
    
    let menuWidth : CGFloat = 0.76
    let percentThreshold:CGFloat = 0.35
    let viewTag = 007
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    
    // ---- UIViewControllerAnimatedTransitioning methods
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)  {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext: transitionContext)
        }
        else {
            animateDismissalWithTransitionContext(transitionContext: transitionContext)
        }
    }
    
    
    // ---- Helper methods
    
    func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView = transitionContext.containerView as? UIView
            else {
                return
        }
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        // replace main view with snapshot
        let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false)
        snapshot?.tag = viewTag
        snapshot?.isUserInteractionEnabled = false
        snapshot?.layer.shadowOpacity = 1.0
        containerView.insertSubview(snapshot!, aboveSubview: toVC.view)
        fromVC.view.isHidden = true
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                snapshot!.center.x += UIScreen.main.bounds.width * self.menuWidth
            },
            completion: { _ in
                fromVC.view.isHidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
    
    func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView = transitionContext.containerView as? UIView
            else {
                return
        }
        let snapshot = containerView.viewWithTag(viewTag)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                snapshot?.frame = CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size)
            },
            completion: { _ in
                let didTransitionComplete = !transitionContext.transitionWasCancelled
                if didTransitionComplete {
                    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
                    snapshot?.removeFromSuperview()
                }
                transitionContext.completeTransition(didTransitionComplete)
            }
        )
    }
}


