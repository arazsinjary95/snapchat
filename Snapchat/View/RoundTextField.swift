//
//  RoundTextField.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/11/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {
    @IBInspectable var  cornerRaduis: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRaduis
            layer.masksToBounds = cornerRaduis > 0
        }
    }
    
    @IBInspectable var  borderWith: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var  borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var  bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: placeholderColor!])
            attributedPlaceholder = str
        }
    }
}
