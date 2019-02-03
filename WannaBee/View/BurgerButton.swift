//
//  BurgerButton.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 28/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class BurgerButton: UIButton {


    override func draw(_ rect: CGRect) {
        
        let halfHeight = bounds.height / 2
        let sliceDistance: CGFloat = 10
        let lineWidth: CGFloat = 4
        let margin: CGFloat = 8
        
        let topPath = UIBezierPath()
        topPath.lineWidth = lineWidth
        topPath.move(to: CGPoint(x: margin, y: halfHeight - sliceDistance))
        topPath.addLine(to: CGPoint(x: bounds.width - margin, y: halfHeight - sliceDistance))
        
        let middlePath = UIBezierPath()
        middlePath.lineWidth = lineWidth
        middlePath.move(to: CGPoint(x: margin, y: halfHeight))
        middlePath.addLine(to: CGPoint(x: bounds.width - margin, y: halfHeight))
        
        let bottomPath = UIBezierPath()
        bottomPath.lineWidth = lineWidth
        bottomPath.move(to: CGPoint(x: margin, y: halfHeight + sliceDistance))
        bottomPath.addLine(to: CGPoint(x: bounds.width - margin, y: halfHeight + sliceDistance))
        
        UIColor.white.setStroke()
        
        topPath.stroke()
        middlePath.stroke()
        bottomPath.stroke()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = ColorCollection.mainColor
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setSize(width: 50, height: 50)
    }


}
