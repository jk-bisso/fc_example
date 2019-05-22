//
//  CollectionViewController.swift
//  wantedExt
//
//  Created by JK-PC on 21/05/2019.
//  Copyright © 2019 JK-PC. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let bountyInfoList = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 3000000000),
        BountyInfo(name: "nami", bounty: 160000000),
        BountyInfo(name: "robin", bounty: 800000000),
        BountyInfo(name: "sanji", bounty: 770000000),
        BountyInfo(name: "zoro", bounty: 1200000000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.bountyInfo = bountyInfoList[index]
            }
        }
    }
    
    // 몇 개 보여줄 지?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    // 셀 어떻게 보여줄 지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        
        let info = bountyInfoList[indexPath.item]
        cell.updateUI(info)
        return cell
    }
    
    // 클릭 됐을 때?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // 사이즈 ?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = 150
//        let height: CGFloat = 350
        
        // 셀 하나의 너비 = (컬렉션 뷰 - 10) / 2 -> 2개씩 배열할 때
        let width: CGFloat = (collectionView.bounds.width - 10) / 2
        
        // 셀 하나의 높이 = 이미지 뷰 높이 + 65정도의 높이 -> 이미지 뷰의 비율은 7:10 이기 때문에
        let height: CGFloat = (width * 10 / 7) + 65
        
        return CGSize(width: width, height: height)
    }

}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func updateUI(_ info: BountyInfo) {
        imgView.image = info.image;
        nameLabel.text = info.name
        bountyLabel.text = "$ \(info.bounty)"
    }
}
