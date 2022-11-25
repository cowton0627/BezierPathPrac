//
//  ViewController.swift
//  BezierPathPrac
//
//  Created by Chun-Li Cheng on 2022/2/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: RoundedCornerImageView!
    @IBOutlet var dividingLineLabel: UILabel!
    let bounds = UIScreen.main.bounds
    let angle = CGFloat.pi/180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
        imageView.corners = [.topRight, .topLeft]
        imageView.width = 20
        
//        makeUIView()
        
//        let newView = UIView(frame: CGRect(x: bounds.midX - 150,
//                                        y: bounds.midY - 200,
//                                        width: 300,
//                                        height: 400))
//        newView.backgroundColor = .yellow
//        self.view.addSubview(newView)
        
//        setupView()
        
        // 貝茲曲線
//        let path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - 100,
//                                               y: bounds.midY - 50,
//                                               width: 200,
//                                               height: 100))
        
//        let path = UIBezierPath(rect: CGRect(x: bounds.midX - 50,
//                                             y: bounds.midY - 50,
//                                             width: 100,
//                                             height: 100))
        
//        let path = UIBezierPath(roundedRect: CGRect(x: bounds.midX - 50,
//                                                    y: bounds.midY - 50,
//                                                    width: 100,
//                                                    height: 100),
//                                cornerRadius: 20)

        let path = UIBezierPath(roundedRect: CGRect(x: bounds.midX - 100,
                                                    y: bounds.midY - 50,
                                                    width: 200,
                                                    height: 100),
                                byRoundingCorners: [
                                                    .topLeft,
                                                    .bottomLeft,
                                                    .topRight,
                                                    .bottomRight
                                ],
                                cornerRadii: CGSize(width: 0, height: 0))
        
//        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX,
//                                                   y: bounds.midY),
//                                radius: 50,
//                                startAngle: angle * -90,
//                                endAngle: angle * 90,
//                                clockwise: true)
        
        // 外框
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 8.0
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        
        view.layer.addSublayer(shape)


        // 設定漸層
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor,
                           UIColor.green.cgColor]
        
        // 設定遮罩
        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        gradient.mask = shapeMask
        
        view.layer.addSublayer(gradient)
        
//        dividingLineLabel.text = "\(solution(100))"
        dividingLineLabel.text = ""

        
    }
    
    private func setupView() {
        let size = UIScreen.main.bounds.size
        var leftView = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: size.width/2,
                                            height: size.height/2))
        leftView.backgroundColor = .systemBrown
        view.addSubview(leftView)
                
        var leftPath = UIBezierPath(ovalIn: CGRect(x: bounds.midX - 100,
                                                   y: bounds.midY - 50,
                                                   width: 200,
                                                   height: 100))
                
        let leftShapeLayer = CAShapeLayer()
        leftShapeLayer.path = leftPath.cgPath

        leftShapeLayer.lineWidth = 8.0
        leftShapeLayer.fillColor = UIColor.clear.cgColor
        leftShapeLayer.strokeColor = UIColor.black.cgColor

        leftView.layer.mask = leftShapeLayer
    }
    
    // 做分隔線
    public func solution(_ N : Int) -> String {
        // write your code in Swift 4.2.1 (Linux)
        var ind: String = ""
        if N%2 == 0 {
            for index in 1...N/2 {
                ind += "+-"
            }
           
        } else {
            for index in 1...N/2 {
                ind += "+-"
            }
            ind += "+"
        }
        return ind
    }
    
    func makeUIView() -> UIView {
            let redView = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 300,
                                               height: 300))
            let mapleView = UIView(frame: redView.frame)
            mapleView.backgroundColor = UIColor.red
        
            let path = UIBezierPath(ovalIn: CGRect(x: 0,
                                                   y: 0,
                                                   width: 100,
                                                   height: 100))
        
            let mapleShapeLayer = CAShapeLayer()
            mapleShapeLayer.path = path.cgPath
//            mapleShapeLayer.lineWidth = 6.0
//            mapleShapeLayer.strokeColor = UIColor.black.cgColor
        
            mapleView.layer.mask = mapleShapeLayer
            let moveDistance = path.bounds.maxX * 2
            let transform = CGAffineTransform(translationX: moveDistance,
                                              y: 0).scaledBy(x: -1, y: 1)
            mapleShapeLayer.setAffineTransform(transform)
            redView.addSubview(mapleView)
            redView.center = CGPoint(x: bounds.width/2,
                                     y: bounds.height/2)
            view.addSubview(redView)
        
            return redView
    }

}

