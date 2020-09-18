//
//  CustomNavigationBar.swift
//  UICustomizing
//
//  Created by 304 on 2020/09/18.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    //높이로 사용할 값을 설정
    var customHeight : CGFloat = 200
    
    //크기를 설정하는 메소드 재정의
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
    
    //하위 뷰들의 배치를 해주는 메소드
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //상태바의 높이를 가져와서 프레임을 다시 설정
        let y = UIApplication.shared.statusBarFrame.height
        frame = CGRect(x: frame.origin.x, y: y, width: frame.size.width, height: customHeight)
        
        //모든 하위 뷰들을 순회
        for subview in self.subviews{
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            //하위 뷰 중에서 bar와 관련된 뷰들의 배경색을 네비게이션 바의 색상과 동일하게 설정
            if stringFromClass.contains("BarBackground"){
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent"){
                subview.frame = CGRect(x: 0, y: 20, width: self.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
        }
    }
}

