//
//  RoundButton.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/11/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
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
}
