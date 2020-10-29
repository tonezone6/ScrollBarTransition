//
//  UINavigationBar+Cusom.swift
//  NavBarCustomTest
//
//  Created by Alex on 29/10/2020.
//

import UIKit

extension UINavigationBar {
    enum Style {
        case opaque(CGFloat)
        case transparent
    }
    
    enum BackButtonStyle {
        case plain, rounded
    }
    
    func change(style: Style) {
        tintColor = .black

        switch style {
        case .transparent:
            setBackgroundImage(UIImage(), for: .default)
            shadowImage = UIImage()
            // isTranslucent = true
        
        case .opaque(let alpha):
            let color = UIColor(white: 1, alpha: alpha)
            backgroundColor = color
            UIApplication.shared.statusView?.backgroundColor = color
        }
    }
    
    func setupBackButton(style: BackButtonStyle) {
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        var name: String
        
        switch style {
        case .plain:   name = "chevron.backward"
        case .rounded: name = "arrow.backward.circle.fill"
        }
        let image = UIImage(systemName: name, withConfiguration: boldConfig)
        
        backIndicatorImage = image
        backIndicatorTransitionMaskImage = image
        backItem?.title = ""
    }
}
