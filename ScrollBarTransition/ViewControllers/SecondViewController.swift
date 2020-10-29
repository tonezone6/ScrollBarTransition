//
//  ViewController.swift
//  NavBarCustomTest
//
//  Created by Alex on 28/10/2020.
//

import UIKit

final class SecondViewController: ScrollBarTransitionController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTransition(with: scrollView, andThreshold: 200)
    }
}
