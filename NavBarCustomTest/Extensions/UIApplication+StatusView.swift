//
//  UIapplication+StatusView.swift
//  NavBarCustomTest
//
//  Created by Alex on 29/10/2020.
//

import UIKit

extension UIApplication {
    var statusView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 999
            let window = connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.windows.first
            
            if let statusBar = window?.viewWithTag(tag) {
                return statusBar
            } else {
                let height = window?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
                let statusBar = UIView(frame: height)
                statusBar.tag = tag
                statusBar.layer.zPosition = 999
                window?.addSubview(statusBar)
                return statusBar
            }
        } else if responds(to: Selector(("statusBar"))), let statusBar = value(forKey: "statusBar") as? UIView {
            return statusBar
        }
        
        return nil
    }
}
