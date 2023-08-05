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
    
    var tama: TamaType? = .bbang
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designView()
    }
    
    
    func designView() {
        // 뷰 디자인
        popupView.backgroundColor = TamaColor.back.tcolor
        popupView.layer.cornerRadius = 10
        
        // 버튼 디자인
        okButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        cancelButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        forCancelButtonView.backgroundColor = .black
        forCancelButtonView.layer.opacity = 0.05
        okButton.setTitle("시작하기", for: .normal)
        cancelButton.setTitle("취소", for: .normal)
        okButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        cancelButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        
        
        okButton.titleLabel?.font = .systemFont(ofSize: 10)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 15)
        
        
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
}