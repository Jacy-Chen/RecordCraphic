//
//  PushButtonView.swift
//  RecordCraphic
//
//  Created by Zexi Chen on 7/21/16.
//  Copyright © 2016 Jacy Chen. All rights reserved.
//

import UIKit

@IBDesignable
//允许自己的内容样式设计在storyboard上面能够实时更新

class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing the Circle Shape
        let path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        // For the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // Create the path
        let plusPath = UIBezierPath()
        
        // set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        //此处添加0.5浮动来解决可能的锯齿问题
        // move the initial point of the path
        // to the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 - plusWidth/2+0.5, y: bounds.height/2+0.5))
        
        // add point to the path at the end of the horizontal stroke
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        // set the stroke color
        UIColor.whiteColor().setStroke()
        
        
        if isAddButton {
            //For the vertical line
            //move to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 - plusWidth/2 + 0.5))
            
            //add the end point to the vertical stroke
            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        // draw the stroke
        plusPath.stroke()
    }
 

}
