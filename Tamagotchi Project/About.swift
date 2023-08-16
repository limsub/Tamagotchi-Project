//
//  About.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

// 물밥 에러
enum FoodError: Error {
    case isNotInRange
    case isNotInt
}

// 물이냐 밥이냐
enum Food {
    case bob
    case mul
}

// 다마고치 정보 class
class TamaInfo {
    var tama: TamaType
    var level: Int
    var bob: Int
    var mul: Int
    
    init(tama: TamaType, level: Int, bob: Int, mul: Int) {
        self.tama = tama
        self.level = level
        self.bob = bob
        self.mul = mul
    }
}

// 다마고치 타입 enum
// 타입에 따라 이름&이미지 계산
enum TamaType: Int, CaseIterable {
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
    var tExplain: String {
        switch self {
        case .dda : return "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:) "
        case .bbang : return "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실! "
        case .jjack : return "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~"
        default : return ""
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
    case SelectViewController
    case SelectCollectionViewCell
    case DetailSelectViewController
    case MainViewController
    case SettingViewController
    case SettingTableViewCell
    case ModifyNameViewController
    case ChangeTamaViewController
    case DetailChangeTamaViewController
}

