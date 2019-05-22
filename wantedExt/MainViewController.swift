//
//  MainViewController.swift
//  wantedExt
//
//  Created by JK-PC on 21/05/2019.
//  Copyright © 2019 JK-PC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickTableView(_ sender: Any) {
        performSegue(withIdentifier: "showTableView", sender: nil)
    }
    
    @IBAction func onClickCollectionView(_ sender: Any) {
        performSegue(withIdentifier: "showCollectionView", sender: nil)
    }
    
}
