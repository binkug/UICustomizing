//
//  CustomTabBarController.swift
//  UICustomizing
//
//  Created by 304 on 2020/09/18.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let csView = UIView()
    
    let tabItem1 = UIButton(type: .system)
    let tabItem2 = UIButton(type: .system)
    let tabItem3 = UIButton(type: .system)
    
    func addTabBarBtn(btn:UIButton, title:String, tag:Int){
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        btn.setTitleColor(UIColor.yellow, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        
        //버튼에 메소드 연결
        btn.addTarget(self, action: #selector(onTabBarItemClick(_ :)), for: .touchUpInside)
        
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender:UIButton){
        tabItem1.isSelected = false
        tabItem2.isSelected = false
        tabItem3.isSelected = false
        
        sender.isSelected = true
        
        self.selectedIndex = sender.tag
    }
    
    override func viewDidLoad() {
                // 기존 탭 바를 숨김 처리
        self.tabBar.isHidden = true
        
        // 새로운 탭 바 역할을 할 뷰를 위해 기준 좌표와 크기를 정의합니다.
        let width = self.view.frame.width // ①
        let height: CGFloat = 50 // ②
        let x: CGFloat = 0 // ③
        let y = self.view.frame.height - height // ④
        
        // 정의된 값을 이용하여 새로운 뷰의 속성을 설정합니다.
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = UIColor.white
        self.view.addSubview(self.csView)
        
        //버튼의 너비와 높이를 설정한다.
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        //버튼의 영역을 차례로 설정한다.
        self.tabItem1.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem2.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem3.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        //버튼의 공통 속성을 설정하고, 뷰에 추가한다.
        self.addTabBarBtn(btn: self.tabItem1, title: "첫 번째 화면", tag: 0)
        self.addTabBarBtn(btn: self.tabItem2, title: "두 번째 화면", tag: 1)
        self.addTabBarBtn(btn: self.tabItem3, title: "세 번째 화면", tag: 2)
        
        // 처음에 첫 번째 탭이 선택되어 있도록 초기 상태를 정의해 준다.
        self.onTabBarItemClick(self.tabItem1)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
