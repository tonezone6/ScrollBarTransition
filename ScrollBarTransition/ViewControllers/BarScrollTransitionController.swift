//
//  BarTranzitionController.swift
//  NavBarCustomTest
//
//  Created by Alex on 29/10/2020.
//

import UIKit

class ScrollBarTransitionController: UIViewController {
    private var scrollView: UIScrollView?
    private var threshold: CGFloat = 0
    
    private var bar: UINavigationBar? {
        navigationController?.navigationBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareForTransition()
    }
    
    func setupForTransition(_ scrollView: UIScrollView, threshold: CGFloat) {
        self.scrollView = scrollView
        self.scrollView?.contentInsetAdjustmentBehavior = .never
        self.scrollView?.delegate = self
        
        self.threshold = threshold
    }
    
    private func prepareForTransition() {
        bar?.change(style: .transparent)
        bar?.setupBackButton(style: .rounded)
        navigationItem.title = ""
    }
}

extension ScrollBarTransitionController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Bar alpha.
        let alpha = min(1, scrollView.contentOffset.y/threshold)
        bar?.change(style: .opaque(alpha))
        
        // Back button style.
        let changeBackButton = scrollView.contentOffset.y > threshold/2
        if changeBackButton {
            bar?.setupBackButton(style: .plain)
            navigationItem.title = title
        } else {
            bar?.setupBackButton(style: .rounded)
            navigationItem.title = ""
        }
    }
}
