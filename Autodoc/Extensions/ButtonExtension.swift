//
//  ButtonExtension.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = .avenir14(),
                     isShadow: Bool = false,
                     cornerRadius: CGFloat = 5,
                     borderColor: UIColor = .mainDark(),
                     borderWidth: Int = 1,
                     widthAnchor: Int = 250,
                     heightAnchor: Int = 40) {
        self.init(type: .system)
        
        let attributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.underlineStyle: 0,
        NSAttributedString.Key.foregroundColor: titleColor
        ]

        let attributedString = NSMutableAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        self.widthAnchor.constraint(equalToConstant: CGFloat(widthAnchor)).isActive = true
        self.heightAnchor.constraint(equalToConstant: CGFloat(heightAnchor)).isActive = true
    }
}
