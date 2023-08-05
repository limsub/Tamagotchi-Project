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
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.SettingTableViewCell.rawValue) as! SettingTableViewCell
        
        cell.designCell(indexPath.row)
        
        //cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 0 -> 이름 변경
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.ModifyNameViewController.rawValue) as! ModifyNameViewController
            
            navigationController?.pushViewController(vc, animated: true)
        
        // 1-> 다마고치 변경
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.ChangeTamaViewController.rawValue) as! ChangeTamaViewController
            
            navigationController?.pushViewController(vc, animated: true)
        
        // 2-> 데이터 초기화
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "아냐!", style: .cancel)
            let ok = UIAlertAction(title: "웅", style: .default) { _ in
                // userDefaults 초기화 후 뷰 초기화 후 맨처음화면
                UserDefaults.standard.set("대장", forKey: "userName")
                UserDefaults.standard.set(1, forKey: "level")
                UserDefaults.standard.set(0, forKey: "bob")
                UserDefaults.standard.set(0, forKey: "mul")
                UserDefaults.standard.set(false, forKey: "isLogin")
                
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: Identifier.SelectViewController.rawValue) as! SelectViewController
                let nav = UINavigationController(rootViewController: vc)
                
                sceneDelegate?.window?.rootViewController = nav
                sceneDelegate?.window?.makeKeyAndVisible()
            }
            
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true)
        default :
            break;
        }
        settingTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func setUp() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }

}
