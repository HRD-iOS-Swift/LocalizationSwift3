//
//  ViewController.swift
//  LocalizeStringDemo
//
//  Created by Kokpheng on 1/10/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var khmerButton: UIButton!
    @IBOutlet weak var changeLangaugeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load localized text to control
        setupControl()
    }
    
    @IBAction func changeLangauge(_ sender: UISegmentedControl) {
        
        /* Change Language */
        let languageManager = LanguageManager.shared
        
        // Set language by selectedSegment
        if sender.selectedSegmentIndex == 0  {
            let localeForRow = languageManager.availableLocales[0]
            languageManager.language = localeForRow
            print("Language selected: ", localeForRow.languageName)
        }else if sender.selectedSegmentIndex == 1 {
            let localeForRow = languageManager.availableLocales[1]
            languageManager.language = localeForRow
            print("Language selected: ", localeForRow.languageName)
        }
        
        /* Update control language */
        setupControl()
    }
    
    private func setupControl() {
        // set text to control by calling extension localized property of String
        self.topLabel!.text = "Label".localized
        self.englishButton.setTitle("EnglishButton".localized, for: .normal)
        self.khmerButton.setTitle("KhmerButton".localized, for: .normal)
        self.changeLangaugeSegment.setTitle("EnglishButton".localized, forSegmentAt: 0)
        self.changeLangaugeSegment.setTitle("KhmerButton".localized, forSegmentAt: 1)
    }
    
}

