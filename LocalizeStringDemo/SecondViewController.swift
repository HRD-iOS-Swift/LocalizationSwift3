//
//  SecondViewController.swift
//  LocalizeStringDemo
//
//  Created by Kokpheng on 1/10/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var sampleButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sampleButton.setTitle("KhmerButton".localized, for: .normal)
        self.topLabel.text = "Label".localized
    }
}
