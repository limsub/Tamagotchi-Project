//
//  MainViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {
    
    var tama: TamaType?
    var userName: String?
    var level: Int?
    var bob: Int?
    var mul: Int?
    
    var data: TamaInfo?
    
    
    
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var explainImageView: UIImageView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var bobTextField: UITextField!
    @IBOutlet var mulTextField: UITextField!
    @IBOutlet var bobButton: UIButton!
    @IBOutlet var mulButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터 받아오기
        tama = TamaType(rawValue: UserDefaults.standard.integer(forKey: "tama") )
        userName = UserDefaults.standard.string(forKey: "userName")
        level = UserDefaults.standard.integer(forKey: "level")
        bob = UserDefaults.standard.integer(forKey: "bob")
        mul = UserDefaults.standard.integer(forKey: "mul")
        
        // 데이터 적용
        data = TamaInfo(tama: tama!, level: level!, bob: bob!, mul: mul!)
        
        // navigation item
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = TamaColor.font.tcolor
        
        
        navigationItem.title = "\(userName!)님의 다마고치"
        
        navigationItem.titleView?.tintColor = TamaColor.font.tcolor
        navigationController?.navigationBar.layer.addBorder([.bottom], color: .systemGray4, width: 1)
        
        initialDesign()

    }
    @objc
    func settingButtonTapped(_ sender: UIButton) {
        print("hi")
    }
    
    // 초기 디자인
    func initialDesign() {
        // view
        view.backgroundColor = TamaColor.back.tcolor
        
        // explainImage
        explainImageView.image = UIImage(named: "bubble")
        explainImageView.contentMode = .scaleAspectFit
        
        // explainLabel
        explainLabel.text = "안녕하세여"
        explainLabel.textColor = TamaColor.font.tcolor
        explainLabel.font = .systemFont(ofSize: 14)
        
        // mainImage - 다마고치 종류 + 레벨에 따라 계산하는 함수 필요
        mainImageView.image = UIImage(named: "1-1")
        
        // nameLabel
        nameLabel.text = " " + tama!.tname + "  "
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        nameLabel.layer.borderColor = TamaColor.font.tcolor.cgColor
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        
        // infoLabel
        infoLabel.text = "Lv\(level!) • 밥알 \(bob!)개 • 물방울 \(mul!)개"
        infoLabel.textColor = TamaColor.font.tcolor
        infoLabel.font = .systemFont(ofSize: 14)
        
        // Button
        configureButton(bobButton, "밥먹기", "drop.circle")
        configureButton(mulButton, "물먹기", "leaf.circle")
        
        // textfield
        configureTextField(bobTextField, "밥주세용")
        configureTextField(mulTextField, "물주세용")
    }
    
    func configureButton(_ sender: UIButton, _ title: String, _ image: String) {
//        var config = UIButton.Configuration.plain()
//        config.title = title
//        config.image = UIImage(systemName: image)
//        config.baseForegroundColor = TamaColor.font.tcolor
//        config.imagePadding = 3
//        sender.configuration = config
        
        sender.configuration?.buttonSize = .mini
        sender.configuration?.imagePadding = 3
        
        sender.setTitle(title, for: .normal)
        sender.setTitleColor(TamaColor.font.tcolor, for: .normal)
        sender.setTitleColor(TamaColor.font.tcolor, for: .highlighted)
        sender.titleLabel?.font = .systemFont(ofSize: 11)
        sender.setImage(UIImage(systemName: image), for: .normal)
        sender.tintColor = TamaColor.font.tcolor
        
        sender.layer.borderWidth = 1
        sender.layer.borderColor = TamaColor.font.tcolor.cgColor
        sender.layer.cornerRadius = 5
        
        
//        sender.setTitle(title, for: .normal)
//        sender.setTitle(title, for: .highlighted)
//        sender.titleLabel?.font = .systemFont(ofSize: 9)
     
    }

    func configureTextField(_ sender: UITextField, _ message: String) {
        sender.borderStyle = .none
        sender.layer.addBorder([.bottom], color: TamaColor.font.tcolor, width: 1)
        
        sender.backgroundColor = .clear
        sender.textAlignment = .center
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        sender.attributedPlaceholder = NSAttributedString(
            string: message,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
    }
    
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
