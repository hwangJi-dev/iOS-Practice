//
//  CalendarVC.swift
//  Weathy_demo
//
//  Created by 황지은 on 2020/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum CardState {
        case expanded
        case collapsed
    }
    
    
    var cardViewController:CardViewController!
    var visualEffectView:UIVisualEffectView!
    
    let cardHeight:CGFloat = 405
    let cardHandleAreaHeight:CGFloat = 68
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
    
    
    func setupCard(){
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height -  cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        cardViewController.view.clipsToBounds = true
        
        let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleCardPan(recognzier:)))
        
        cardViewController.handleArea.addGestureRecognizer(tabGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer){
        
    }
    
    @objc
    func handleCardPan(recognzier:UITapGestureRecognizer){
        switch recognzier.state {
        case .began:
            //startTransition
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            // updateTransition
            updateInteractiveTransition(fractionCompleted: 0)
        case .ended:
            // continueTransition
            continueInteractiveTransition()
        default:
            break
        }
    }
    
    func animateTransitionIfNeeded(state:CardState, duration:TimeInterval){
        if runningAnimations.isEmpty{
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1){
                switch state {
                case .expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            frameAnimator.addCompletion{ _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval){
        if runningAnimations.isEmpty {
            // run animations
            animateTransitionIfNeeded(state: state, duration: duration)
            
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
        
    }
    func continueInteractiveTransition(){
        
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
        
    }
    
}
