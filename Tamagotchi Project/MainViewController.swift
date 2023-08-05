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
    
    var data = TamaInfo(
        tama: TamaType(rawValue: UserDefaults.standard.integer(forKey: "tama") )!,
        level: UserDefaults.standard.integer(forKey: "level"),
        bob: UserDefaults.standard.integer(forKey: "bob"),
        mul: UserDefaults.standard.integer(forKey: "mul"))
    
    
    
    
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
        
//        UserDefaults.standard.set(0, forKey: "bob")
//        UserDefaults.standard.set(0, forKey: "mul")
//        UserDefaults.standard.set(0, forKey: "level")
//        data.bob = 0
//        data.mul = 0
//        data.level = 0
        
        userName = UserDefaults.standard.string(forKey: "userName")
        
        
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
        mainImageView.image = UIImage(named: selectMainImage())
        
        
        // nameLabel
        nameLabel.text = " " + data.tama.tname + "  "
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        nameLabel.layer.borderColor = TamaColor.font.tcolor.cgColor
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        
        // infoLabel
        infoLabel.text = "Lv\(data.level) • 밥알 \(data.bob)개 • 물방울 \(data.mul)개"
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
    }

    func configureTextField(_ sender: UITextField, _ message: String) {
        sender.borderStyle = .none
        sender.layer.addBorder([.bottom], color: TamaColor.font.tcolor, width: 1)
        
        sender.backgroundColor = .clear
        sender.textAlignment = .center
        
        sender.keyboardType = .numberPad
        
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        sender.attributedPlaceholder = NSAttributedString(
            string: message,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
    }
    
    func selectMainImage() -> String {
        var imageName = ""
        
        switch (data.tama) {
        case .dda : imageName = "1-"
        case .bbang : imageName = "2-"
        case .jjack : imageName = "3-"
        case .preparing:
            break
        }
        
        let level = (data.level < 10) ? String(data.level) : "9"
        imageName = imageName + level
        print(imageName)
        return imageName
    }
    
    
    // 레벨 계산 함수
    func calculateLevel() {
        // 현재 데이터
        let b =  Double(data.bob)
        let m =  Double(data.mul)
        
        let sum = b/5 + m/2
        
        let level: Int
        
        switch sum {
        case 0..<20: level = 1
        case 20..<30 : level = 2
        case 30..<40 : level = 3
        case 40..<50 : level = 4
        case 50..<60 : level = 5
        case 60..<70 : level = 6
        case 70..<80 : level = 7
        case 80..<90 : level = 8
        case 90..<100 : level = 9
        default : level = 10
            
        }
        
        // 1. 데이터 업데이트
        data.level = level
        
        // 2. UserDefaults 저장
        UserDefaults.standard.set(level, forKey: "level")
    }
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func bobButtonTapped(_ sender: UIButton) {
        // 1. data 값 업데이트
        if let txt = bobTextField.text {
            if let cnt = Int(txt) {
                if (cnt < 100) {
                    data.bob += cnt
                }
            } else {
                data.bob += 1
            }
            
            
            
            bobTextField.text = ""
        }
        // 2. userdefaults 업데이트
        UserDefaults.standard.set(data.bob, forKey: "bob")
        
        // 3. 레벨 계산
        calculateLevel()
        
        // ??
        initialDesign()
    }
    
    
    @IBAction func mulButtonTapped(_ sender: UIButton) {
        // 1. data 값 업데이트
        if let txt = mulTextField.text {
            if let cnt = Int(txt) {
                if (cnt < 50) {
                    data.mul += cnt
                }
            }
            else {
                data.mul += 1
            }
            
            
            
            mulTextField.text = ""
        }
        
        // 2. userdefaults 업데이트
        UserDefaults.standard.set(data.mul, forKey: "mul")
        
        // 3. 레벨 계산
        calculateLevel()
        
        
        // ??
        initialDesign()
    }
    
    
}
