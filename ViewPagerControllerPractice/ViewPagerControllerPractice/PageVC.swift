//
//  PageVC.swift
//  ViewPagerControllerPractice
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var identifiers : NSArray = ["FriendsVC" , "ContactsVC"]
    
    
    lazy var VCArray : [UIViewController] = {
        return [self.VCInstance(name: "FriendsVC"),
                self.VCInstance(name: "ContactsVC")]
    }()
    
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        preferredContentSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        self.view.layoutIfNeeded()
        
        }
    
    override func viewWillLayoutSubviews() {
        self.view.layoutIfNeeded()
    }

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        let currentPageIndex: Int = self.identifiers.index(of: pendingViewControllers[0].restorationIdentifier ?? 0)
        //        NSLog("ViewController_willTransitionTo index = %d", currentPageIndex)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        //        print(previousIndex)
        guard previousIndex >= 0 else {
            return VCArray.last
        }
        
        guard VCArray.count > previousIndex else {
            return nil
        }
        
        return VCArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex >= 0 else {
            return VCArray.first
        }
        
        guard VCArray.count > nextIndex else {
            print(nextIndex)
            return nil
        }
        
        return VCArray[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        //        print(pageViewController.index)
        guard let firstViewController = viewControllers?.first else { return 0 }
        guard let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else { return 0 }
        
        //        print(firstViewControllerIndex)
        return firstViewControllerIndex
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> UIViewController? {
        //        NSLog("ViewController getViewControllerAtIndex index: %d", index)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if index == 0 {
            let FriendsVC = storyboard.instantiateViewController(withIdentifier: "FriendsVC") as! FriendsVC
            return FriendsVC
            
        } else if index == 1 {
            let ContactsVC = storyboard.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
            return ContactsVC
            
        }
        else {
            return nil
            
        }
    }

}
