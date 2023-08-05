//
//  SettingViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet var settingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
        let nib = UINib(nibName: Identifier.SettingTableViewCell.rawValue, bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: Identifier.SettingTableViewCell.rawValue)

        title = "설정"
        
        view.backgroundColor = TamaColor.back.tcolor
        settingTableView.backgroundColor = TamaColor.back.tcolor
        
        settingTableView.rowHeight = 50
        settingTableView.separatorInset.left = 0
    }
    
    func designTableView() {
        //settingTableView.style = .insetGrouped
    }


}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.SettingTableViewCell.rawValue) as! SettingTableViewCell
        
        cell.designCell(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 0 -> 이름 변경
        // 1-> 다마고치 변경
        // 2-> 데이터 초기화
    }
    
    
    func setUp() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }

}
