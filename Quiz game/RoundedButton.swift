//
//  RoundedButton.swift
//  Quiz game
//
//  Created by ofcstudent on 6/7/17.
//  Copyright © 2017 ofcstudent. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
    

}
