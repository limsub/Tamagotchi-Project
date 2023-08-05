//
//  About.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

// 다마고치 타입 enum
// 타입에 따라 이름&이미지 계산
enum TamaType: Int {
    case dda
    case bbang
    case jjack
    case preparing
    
    var tname: String {
        switch self {
        case .dda : return "따끔따끔 다마고치"
        case .bbang : return "방실방실 다마고치"
        case .jjack : return "반짝반짝 다마고치"
        case .preparing : return "준비중이에요"
        }
        
    }
    var timage: UIImage {
        switch self {
        case .dda : return UIImage(named: "1-6")!
        case .bbang : return UIImage(named: "2-6")!
        case .jjack : return UIImage(named: "3-6")!
        case .preparing : return UIImage(named: "noImage")!
        }
    }
}

// 배경 / 폰트&테두리 색
enum TamaColor: Int {
    case back
    case font
    
    var tcolor: UIColor {
        switch self {
        case .back: return UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        case .font: return UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        }
    }
}

// 각 뷰컨트롤러 또는 셀에 대한 identifier
enum Identifier: String {
    case SelectCollectionViewCell
}

