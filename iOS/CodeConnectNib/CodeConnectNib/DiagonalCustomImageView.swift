//
//  DiagonalCustomImageView.swift
//  CodeConnectNib
//
//  Created by 서보경 on 2020/09/24.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {
    // 대각선으로 잘린 사각형을 그린다.
    
    @IBInspectable var innerHeight: CGFloat = 0
    // bezierPath
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        
        path.close()
        
        return path
    }
    
    // path -> layer
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    
    // layer -> mask
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        makeMask()
    }
    
    
    // 내가 만든 커스텀 코드 -> storyboard 편집 화면에서 바로 확인
}
