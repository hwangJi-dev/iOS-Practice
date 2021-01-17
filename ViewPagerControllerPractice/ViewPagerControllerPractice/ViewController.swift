//
//  ViewController.swift
//  ViewPagerControllerPractice
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate,CustomSegmentedControlDelegate {
    
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var containerViewHeight: NSLayoutConstraint!
    @IBOutlet var containerVIew: UIView!
    
    private var lastContentOffset: CGFloat = 0.0
    @IBOutlet var cvTopConstraint: NSLayoutConstraint!
    @IBOutlet var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet var segmentView: CustomSegmentedControl!{
        didSet{
            segmentView.setButtonTitles(buttonTitles: ["OFF 5","HTTP"])
            segmentView.selectorViewColor = .orange
            segmentView.selectorTextColor = .orange
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  scrollViewHeight.constant = containerViewHeight.constant
        segmentView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
 
    var changingIndex = false
    
    func change(to index: Int) {
        print("hhhh")
        changingIndex = true
        let x = segmentView.selectedIndex * Int(scrollview.frame.width)
        scrollview.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        changingIndex = false
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        if scrollView == scrollview {
            if !changingIndex{
                segmentView.setIndex(index: Int(round(scrollview.contentOffset.x / scrollview.frame.size.width)))
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

//         let translation = scrollview.panGestureRecognizer.translation(in: scrollview.superview)
//         var isScrollingDown = translation.y > 0
//         let offset = scrollview.contentOffset.y
//
//         if isScrollingDown, offset <= scrollHeight { //scrollHeight is equal to the height of the header cell
//             containerVIew.isScrollEnabled = false
//         }
//         else if !isScrollingDown, offset >= scrollHeight {
//             greenScrollView.isScrollEnabled = true
//         }
//     }

}

}
