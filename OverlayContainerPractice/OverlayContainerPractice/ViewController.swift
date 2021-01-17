//
//  ViewController.swift
//  OverlayContainerPractice
//
//  Created by 황지은 on 2021/01/01.
//

import UIKit
import OverlayContainer

class ViewController: OverlayContainerViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        let mainController = story.instantiateViewController(identifier: "MainVC") as! MainVC
        
        let detailController = story.instantiateViewController(identifier: "DetailVC") as! DetailVC
        
        let backdropController = story.instantiateViewController(identifier: "BackdropVC") as! BackdropVC
        
        self.viewControllers = [mainController,backdropController,detailController]
        
        self.delegate = self
        
        /// 중간 노치부터  띄우기
        moveOverlay(toNotchAt: 1, animated: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeOpacityView), name: .isSelect, object: nil)
        
    }
    
    @objc func changeOpacityView(_ notification: Notification) {
        print("gg")
        moveOverlay(toNotchAt: 1, animated: false)
    }
    
}

extension ViewController : OverlayContainerViewControllerDelegate {
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController, heightForNotchAt index: Int, availableSpace: CGFloat) -> CGFloat {
        switch Notches.allCases[index] {
        case .minimum:
            return availableSpace * 1/6
        case .medium:
            return availableSpace * 2.1/7
        case .maximum:
            return availableSpace * 3/4
        }
    }
    
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return Notches.allCases.count
    }
    
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController, scrollViewDrivingOverlay overlayViewController: UIViewController) -> UIScrollView? {
        return (overlayViewController as? DetailVC)?.cherishPersonCV
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController, willMoveOverlay overlayViewController: UIViewController, toNotchAt index: Int) {
        
        switch Notches.allCases[index]{
        case .minimum:
            let story = UIStoryboard(name: "Main", bundle: nil)
            
            let mainController = story.instantiateViewController(identifier: "MainVC") as! MainVC
            
            let detailController = story.instantiateViewController(identifier: "DetailVC") as! DetailVC
            
            let backdropController = story.instantiateViewController(identifier: "BackdropVC") as! BackdropVC
            
            self.viewControllers = [backdropController,mainController,detailController]
            
        case .medium:
            let story = UIStoryboard(name: "Main", bundle: nil)
            
            let mainController = story.instantiateViewController(identifier: "MainVC") as! MainVC
            
            let detailController = story.instantiateViewController(identifier: "DetailVC") as! DetailVC
            
            let backdropController = story.instantiateViewController(identifier: "BackdropVC") as! BackdropVC
            
            self.viewControllers = [backdropController,mainController,detailController]
            
        case .maximum:
            let story = UIStoryboard(name: "Main", bundle: nil)
            
            let mainController = story.instantiateViewController(identifier: "MainVC") as! MainVC
            
            let detailController = story.instantiateViewController(identifier: "DetailVC") as! DetailVC
            
            let backdropController = story.instantiateViewController(identifier: "BackdropVC") as! BackdropVC
            
            self.viewControllers = [mainController,backdropController,detailController]
            
        }
    }
    
    
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        shouldStartDraggingOverlay overlayViewController: UIViewController,
                                        at point: CGPoint,
                                        in coordinateSpace: UICoordinateSpace) -> Bool {
        guard let header = (overlayViewController as? DetailVC)?.header else {
            return false
        }
        let convertedPoint = coordinateSpace.convert(point, to: header)
        return header.bounds.contains(convertedPoint)
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        willStartDraggingOverlay overlayViewController: UIViewController){}
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        willEndDraggingOverlay overlayViewController: UIViewController,
                                        atVelocity velocity: CGPoint){}
    
    
    

enum Notches : Int, CaseIterable {
    case minimum, medium, maximum
}
}

extension Notification.Name {
    static let isSelect = Notification.Name("isSelect")
}
