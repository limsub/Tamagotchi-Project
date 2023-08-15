//
//  DetailSelectViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class DetailSelectViewController: UIViewController {
    
    @IBOutlet var popupView: UIView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lineView: UIView!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var forCancelButtonView: UIView!  // cancelButton 색깔 바꾸기 용 view
    @IBOutlet var backView: UIView! // 뒷배경 opacity용 view
    var tama: TamaType?  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designView()
    }
    
    
    func designView() {
        // 뷰 디자인
        popupView.backgroundColor = TamaColor.back.tcolor
        popupView.layer.cornerRadius = 10
        
        backView.layer.backgroundColor = UIColor.black.cgColor.copy(alpha: 0.5)
//        backView.layer.opacity = 0.5

        lineView.backgroundColor = .opaqueSeparator

        // 버튼 디자인
        okButton.titleLabel?.adjustsFontForContentSizeCategory = true
//        okButton.titleLabel?.text = "시작하기"
        okButton.setTitle("시작하기", for: .normal)
        cancelButton.setTitle("취소", for: .normal)
        okButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        cancelButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        okButton.setTitleColor(.systemGray4, for: .highlighted)
        cancelButton.setTitleColor(.systemGray4, for: .highlighted)
        
        
        okButton.titleLabel?.font = .systemFont(ofSize: 14)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 14)
        
        okButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        cancelButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        forCancelButtonView.backgroundColor = .black
        forCancelButtonView.layer.opacity = 0.05
        
        
//        okButton.configuration?.buttonSize = .mini
//        okButton.configuration?.buttonSize = .mini
    
        
        
        // 이름 레이블 디자인
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.layer.borderColor = TamaColor.font.tcolor.cgColor
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.text = " " + tama!.tname + "  "
        
        // 이미지 디자인
        mainImageView.image = tama?.timage
        
        // 설명 디자인
        explainLabel.text = tama?.tExplain
        explainLabel.textAlignment = .center
        explainLabel.numberOfLines = 0
        explainLabel.textColor = TamaColor.font.tcolor
        explainLabel.font = .systemFont(ofSize: 14)
        
        
    }
    
    
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        // UserDefaults 저장
        UserDefaults.standard.set(tama?.rawValue, forKey: "tama")
        UserDefaults.standard.set("대장", forKey: "userName")
        UserDefaults.standard.set(1, forKey: "level")
        UserDefaults.standard.set(0, forKey: "bob")
        UserDefaults.standard.set(0, forKey: "mul")
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        
        // 화면 전환
        
        // 기존 코드 : 뷰를 더 쌓는 구조
//        let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.MainViewController.rawValue) as! MainViewController
//        let nav = UINavigationController(rootViewController: vc)
//
//        nav.modalTransitionStyle = .crossDissolve
//        nav.modalPresentationStyle = .fullScreen
//
//        navigationController?.pushViewController(vc, animated: true)
        
        
        // 8/14 수정사항
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.MainViewController.rawValue) as! MainViewController
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
        
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}
