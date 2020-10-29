//
//  ViewController.swift
//  NavBarCustomTest
//
//  Created by Alex on 28/10/2020.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.change(style: .transparent)
        scrollView.delegate = self
    }
}

extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let threshold: CGFloat = 200
        let alpha = min(1, scrollView.contentOffset.y/threshold)
        navigationController?.navigationBar.change(style: .opaque(alpha))
    }
}
