//
//  SelectViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//


/* 다마고치 선택 화면 */

// 1. 셀뷰 연결
// 2. 셀 연결

import UIKit

class SelectViewController: UIViewController {
    
    
    @IBOutlet var maincollectionView: UICollectionView!
    
    
    var data = TamaType.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Identifier.SelectCollectionViewCell.rawValue, bundle: nil)
        maincollectionView.register(nib, forCellWithReuseIdentifier: Identifier.SelectCollectionViewCell.rawValue)
        
        setUp()
        configureCollectionViewLayout()
        
        // 기본 설정
        
        title = "다마고치 선택하기"
        view.backgroundColor = TamaColor.back.tcolor
        maincollectionView.backgroundColor = TamaColor.back.tcolor
        
        
//        // navigation background color..
//        navigationItem.title = "하이"
//        navigationItem.titleView?.backgroundColor = .black
//        navigationItem.titleView?.tintColor = .systemPink
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .black //TamaColor.back.tcolor
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
        
    }
    
}


// 확장 - 프로토콜 채택
extension SelectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = maincollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.SelectCollectionViewCell.rawValue, for: indexPath) as! SelectCollectionViewCell
        
        if (indexPath.row < 3) {
            cell.designCell(data[indexPath.row])
            
        }
        else {
            cell.designCell(.preparing)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row < 3) {
            let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.DetailSelectViewController.rawValue) as! DetailSelectViewController
            let nav = UINavigationController(rootViewController: vc)
            vc.tama = data[indexPath.row]
            nav.modalPresentationStyle = .overFullScreen
            present(nav, animated: true)
        }
    }
    
    func setUp() {
        maincollectionView.delegate = self
        maincollectionView.dataSource = self
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 15
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width/3, height: width/3 + 20)
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        maincollectionView.collectionViewLayout = layout
    }
}
