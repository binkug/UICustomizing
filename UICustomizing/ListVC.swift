//
//  ListVC.swift
//  UICustomizing
//
//  Created by 304 on 2020/09/18.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ListVC: UITableViewController {
    //상위 뷰 컨트롤러에 대한 포인터
    var p : ViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return p.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }

        cell!.textLabel?.text = p.list[indexPath.row]
        return cell!
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        p.selectedIndex = indexPath.row
    }

}
