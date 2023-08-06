//
//  DetailChangeTamaViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class DetailChangeTamaViewController: UIViewController {
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lineView: UIView!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var forCancelButtonView: UIView!
    
    var tama: TamaType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designView()
    }
    

    func designView() {
        popUpView.backgroundColor = TamaColor.back.tcolor
        popUpView.layer.cornerRadius = 10
        
        backView.layer.backgroundColor = UIColor.black.cgColor.copy(alpha: 0.5)
        
        okButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        cancelButton.layer.addBorder([.top], color: .systemGray4, width: 1)
        forCancelButtonView.backgroundColor = .black
        forCancelButtonView.layer.opacity = 0.05
        okButton.setTitle("변경하기", for: .normal)
        cancelButton.setTitle("취소", for: .normal)
        okButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        cancelButton.setTitleColor(TamaColor.font.tcolor, for: .normal)
        okButton.setTitleColor(.systemGray4, for: .highlighted)
        cancelButton.setTitleColor(.systemGray4, for: .highlighted)
        okButton.titleLabel?.font = .systemFont(ofSize: 14)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 14)
        
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.layer.borderColor = TamaColor.font.tcolor.cgColor
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        nameLabel.text = " " + tama!.tname + "  "
        
        mainImageView.image = tama?.timage
        
        explainLabel.text = tama?.tExplain
        explainLabel.textAlignment = .center
        explainLabel.numberOfLines = 0
        explainLabel.textColor = TamaColor.font.tcolor
        explainLabel.font = .systemFont(ofSize: 14)
    }
    
    
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(tama?.rawValue, forKey: "tama")
        
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
