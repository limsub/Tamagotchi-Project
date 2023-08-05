//
//  ChangeTamaViewController.swift
//  Tamagotchi Project
//
//  Created by 임승섭 on 2023/08/05.
//

import UIKit

class ChangeTamaViewController: UIViewController {
    
    @IBOutlet var mainCollectionView: UICollectionView!
    
    var data = TamaType.allCases
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: Identifier.SelectCollectionViewCell.rawValue, bundle: nil)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: Identifier.SelectCollectionViewCell.rawValue)
        
        setUp()
        configureCollectionViewLayout()
        
        title = "다마고치 변경하기"
        view.backgroundColor = TamaColor.back.tcolor
        mainCollectionView.backgroundColor = TamaColor.back.tcolor
    }
}

extension ChangeTamaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.SelectCollectionViewCell.rawValue, for: indexPath) as! SelectCollectionViewCell
        
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
            // 상세 변경화면
            let vc = storyboard?.instantiateViewController(withIdentifier: Identifier.DetailChangeTamaViewController.rawValue) as! DetailChangeTamaViewController
            let nav = UINavigationController(rootViewController: vc)
            vc.tama = data[indexPath.row]
            nav.modalPresentationStyle = .overFullScreen
            present(nav, animated: true)
        }
    }
    
    func setUp() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
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
        
        mainCollectionView.collectionViewLayout = layout
    }
    
}
