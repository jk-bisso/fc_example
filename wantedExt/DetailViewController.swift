//
//  DetailViewController.swift
//  wantedExt
//
//  Created by JK-PC on 21/05/2019.
//  Copyright © 2019 JK-PC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        self.nameLabelCenterX.constant = view.bounds.width
        self.bountyLabelCenterX.constant = view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func updateUI() {
        guard let info = bountyInfo else { return }
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "$ \(info.bounty)"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
