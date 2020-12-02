//
//  LabelExtension.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     font: UIFont? = .avenir20(),
                     color: UIColor = UIColor(named: "BlackAndWhite")!,
                     numberOfLines: Int = 0,
                     textAlignment: NSTextAlignment = .left) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = color
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
