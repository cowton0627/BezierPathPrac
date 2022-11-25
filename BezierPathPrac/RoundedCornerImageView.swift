//
//  RoundedCornerImageView.swift
//  BezierPathPrac
//
//  Created by Chun-Li Cheng on 2022/11/25.
//

import UIKit

class RoundedCornerImageView: UIImageView {
    var corners: UIRectCorner = .allCorners
    var width: Double = 10
    
//    init(image: UIImage?,
//         corners: UIRectCorner,
//         radius: Double) {
//        self.corners = corners
//        self.radius = radius
//        super.init(image: image)
//    }
//    
//    required init?(coder: NSCoder) {
//        corners = .allCorners
//        radius = 10
//        super.init(coder: coder)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezierPath =  UIBezierPath(roundedRect: bounds,
                                       byRoundingCorners: corners,
                                       cornerRadii: CGSize(width: width,
                                                           height: 0))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        layer.mask = shapeLayer
    }
}
