//
//  ButtonDesignable.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/21.
//

import UIKit

class FeedButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get  { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!)}
        set { layer.borderColor = newValue.cgColor }
    }
}
