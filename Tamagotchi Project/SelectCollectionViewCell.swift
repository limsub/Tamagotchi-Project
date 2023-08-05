//
//  SelectCollectionViewCell.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    // 고정 디자인
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 레이블 설정
        nameLabel.textColor = TamaColor.font.tcolor
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 13)
        
        // 레이블 디자인
        nameLabel.layer.borderColor = TamaColor.font.tcolor.cgColor
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.borderWidth = 1
        //nameLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // 데이터
    func designCell(_ sender: TamaType) {
        
        mainImageView.image = sender.timage
        
        nameLabel.text = " " + sender.tname + "  "
    }
    
    

}
