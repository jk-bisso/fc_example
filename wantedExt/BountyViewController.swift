//
//  BountyViewController.swift
//  wantedExt
//
//  Created by JK-PC on 21/05/2019.
//  Copyright © 2019 JK-PC. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 3000000000, 160000000, 800000000, 770000000, 1200000000]
    
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
    
    
    // UITableViewDataSource
    // 몇개를 보여줄까요?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    // 셀은 어떻게 표현할꺼야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        //img, name, bounty
        cell.updateUI(bountyInfoList[indexPath.row])
        return cell
    }
    
    // UITableViewDelegate
    // 셀이 클릭되었을 때 어떻게 할까?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func updateUI(_ info: BountyInfo) {
        imgView.image = info.image;
        nameLabel.text = info.name
        bountyLabel.text = "$ \(info.bounty)"
    }
}
