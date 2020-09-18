//
//  ViewController.swift
//  UICustomizing
//
//  Created by 304 on 2020/09/18.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    //테이블에 출력할 데이터 배열
    var list  = ["키위", "수박", "망고", "사과", "배"]
    //선택한 행 번호를 받기 위한 변수
    var selectedIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "네비게이션\n2줄"
        /*
        //하나의 레이블을 이용해서 2줄 출력
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        //옵션 수정
        titleView.numberOfLines = 2
        titleView.textAlignment = .center
        titleView.textColor = UIColor.white
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.text = "네비게이션\n2줄"
        self.navigationItem.titleView = titleView
        
        //네비게이션 바의 배경 색을 수정
        let color = UIColor(red: 0.02, green: 0.2, blue: 0.5, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = color
        */
        
        //레이블 2개를 배치해서 2줄 문자열 출력
        /*
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        //옵션 수정
        titleView.numberOfLines = 1
        titleView.textAlignment = .center
        titleView.textColor = UIColor.white
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.text = "네비게이션"
        
        let subTitleView = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        //옵션 수정
        subTitleView.numberOfLines = 1
        subTitleView.textAlignment = .center
        subTitleView.textColor = UIColor.white
        subTitleView.font = UIFont.systemFont(ofSize: 12)
        subTitleView.text = "2줄"
        
        let container = UIView(frame: CGRect(x: 0, y: 18, width: 200, height: 40))
        container.addSubview(titleView)
        container.addSubview(subTitleView)
        
        self.navigationItem.titleView = container
        
        //네비게이션 바의 배경 색을 수정
        let color = UIColor(red: 0.02, green: 0.2, blue: 0.5, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = color
 */
        
        //이미지를 설정한 바버튼 2개와 1개의 텍스트 필드와 레이블을 출력
        //텍스트 필드 만들기
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize:12)
        tf.keyboardType = .URL
        tf.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        navigationItem.titleView = tf
        
        //이미지를 이용해서 바 버튼을 만들어서 왼쪽에 배치
        let back = UIImage(named: "arrow-back")
        let leftButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButtonItem
        
        //네비게이션 바의 오른쪽 버튼으로 설정할 View를 생성
        let rv = UIView()
        
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        //레이블을 생성해서 뷰에 추가
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.systemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        cnt.text = "100"
        cnt.textAlignment = .center
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        cnt.layer.cornerRadius = 3
        rv.addSubview(cnt)
        
        //버튼을 생성해서 뷰에 추가
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named:"more"), for: .normal)
        rv.addSubview(more)
        
        //뷰를 가지고 바버튼 아이템 생성
        let rItem = UIBarButtonItem(customView: rv)
        navigationItem.rightBarButtonItem = rItem
        
        
        /*
        //대화상자에 텍스트 필드나 버튼이 아닌 뷰를 출력
        
        //맵 뷰를 생성 - MapKit을 import 해야만 사용 가능
        let mapView = MKMapView(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        
        //위의 뷰를 뷰 컨트롤러의 뷰로 설정
        let vc = UIViewController()
        vc.view = mapView
        
        //크기를 조정하고자 하면 vc의 속성을 이용
        vc.preferredContentSize.height = 300
        
        //대화상자를 생성하고 vc의 view를 대화상자의 뷰로 설정
        let alert = UIAlertController(title: "지도 보여주기", message: "크기는 고정", preferredStyle: .alert)
        alert.setValue(vc, forKeyPath: "contentViewController")
        present(alert, animated: true)
         */
        
        
        //대화상자에 테이블 뷰를 출력해서 선택받기
        /*
        let listVC = ListVC()
        //하위 뷰 컨트롤러에 상위 뷰 컨트롤러의 포인터 넘기기
        listVC.p = self
        
        listVC.preferredContentSize.height = 300
        
        let alert = UIAlertController(title: "과일", message: "과일을 선택하세요", preferredStyle: .alert)
        alert.setValue(listVC, forKeyPath: "contentViewController")
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title:"확인", style: .default){(_) -> Void in
            NSLog("\(self.selectedIndex!) : \(self.list[self.selectedIndex!])")
        })
        present(alert, animated: true)
        */
        warningAlert(msg: "경고창을 직접 디자인")
    }
    
    //문자열을 입력받아서 경고창을 출력해주는 메소드
    func warningAlert(msg : String){
        //대화상자에 출력할 뷰 컨트롤러를 생성
        let alertVC = UIViewController()
        //출력할 이미지를 생성
        let image = UIImage(named: "warning")
        //이미지 뷰를 부착
        alertVC.view = UIImageView(image: image)
        //크기 설정
        alertVC.preferredContentSize = image? .size ?? CGSize.zero
        
        //대화상자 생성해서 위의 뷰 컨트롤러 출력
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        alert.setValue(alertVC, forKey: "contentViewController")
        self.present(alert, animated: true)
        
    }


}

