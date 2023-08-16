//
//  ModifyNameViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class ModifyNameViewController: UIViewController {
    
    let placeholderText = "대장님 이름을 알려주세요!"
    let pastName = UserDefaults.standard.string(forKey: "userName")

    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TamaColor.back.tcolor
        navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = TamaColor.back.tcolor

        navigationItem.title = "대장님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "저장",
            style: .plain,
            target: self,
            action: #selector(saveButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = TamaColor.font.tcolor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: TamaColor.font.tcolor]
        navigationController?.navigationBar.tintColor = TamaColor.font.tcolor
        
        
//        navigationItem.backBarButtonItem?.tintColor = TamaColor.font.tcolor
//        navigationItem.leftBarButtonItem?.tintColor = TamaColor.font.tcolor
        
//        navigationItem.titleView?.tintColor = TamaColor.back.tcolor

        
        
        
        
        
        
        
        nameTextField.borderStyle = .none
        nameTextField.layer.addBorder([.bottom], color: TamaColor.font.tcolor, width: 1)
        nameTextField.backgroundColor = .clear
        nameTextField.placeholder = placeholderText
        
        nameTextField.text = pastName
    }
    
    @objc
    func saveButtonTapped(_ sender: UIButton) {
        var newName: String = ""
        
        do {
            newName = try checkTextField()
        } catch {
            showAlert()
            return;
        }
        
        UserDefaults.standard.set(newName, forKey: "userName")
        navigationController?.popViewController(animated: true)
        
        
        
        
        
        
//        if let newName = nameTextField.text {
//            if (newName.count >= 2 && newName.count <= 6) {
//                UserDefaults.standard.set(newName, forKey: "userName")
//                navigationController?.popViewController(animated: true)
//            }
//            else {
//                showAlert()
//            }
//        }
    }
    
    func checkTextField() throws -> String {
        guard let txt = nameTextField.text else { throw NicknameError.nilName }
        
        guard (txt.count <= 6 && txt.count >= 2) else { throw NicknameError.isNotInRange }
        
        return txt
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "글자 수 오류", message: "대장 이름은 2글자 이상 6글자 이하까지 가능합니다", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
    }
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
}
