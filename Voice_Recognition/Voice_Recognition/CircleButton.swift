//
//  CircleButton.swift
//  Voice_Recognition
//
//  Created by Myeongjin kyeong on 2017. 6. 16..
//  Copyright © 2017년 Myeongjin kyeong. All rights reserved.
//

import UIKit

//버튼에 곡선 넣기

@IBDesignable
class CircleButton: UIButton{
    @IBInspectable var conerRadius : CGFloat = 30.0{
        didSet{
        setupView()
        }
        
        
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    
    
    func setupView(){
        layer.cornerRadius = conerRadius

    }
    
    
}
