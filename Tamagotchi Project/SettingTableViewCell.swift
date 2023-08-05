//
//  SettingTableViewCell.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    let imageName = ["pencil", "moon.fill", "arrow.clockwise"]
    let labelName = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]

    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var secondImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func designCell(_ sender: Int) {
        
        backView.backgroundColor = TamaColor.back.tcolor

        
        firstImageView.image = UIImage(systemName: imageName[sender])
        firstImageView.tintColor = TamaColor.font.tcolor
        
        mainLabel.text = labelName[sender]
        mainLabel.font = .boldSystemFont(ofSize: 14)
        mainLabel.textColor = TamaColor.font.tcolor
        
        nameLabel.text = ""
        nameLabel.textAlignment = .right
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.layer.opacity = 0.6
        nameLabel.font = .systemFont(ofSize: 13)
        
        secondImageView.image = UIImage(systemName: "chevron.forward")
        secondImageView.tintColor = TamaColor.font.tcolor
        secondImageView.layer.opacity = 0.4
        
        
        if (sender == 0) {
            nameLabel.text = UserDefaults.standard.string(forKey: "userName")
        }
    }

    
}
