//
//  StringExtension.swift
//  LocalizeStringDemo
//
//  Created by Kokpheng on 1/10/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        get {
            // check if object of key LanguageCode availabel in UserDefaults or not
            if let data = UserDefaults.standard.object(forKey: LanguageManager.languageCode) {
                // Decode object in UserDefaults to user define class back
                let locale = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Locale
                // Get currect languageCode
                let languageCode = locale.languageCode.lowercased()
                
                // Load Localizable.strings file on currect languageCode
                let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
                let languageBundle = Bundle(path: bundlePath!)
                
                // Translate value base on String
                var translatedString = languageBundle?.localizedString(forKey: self, value: "", table: nil)
                
                // if no string set base String back
                if (translatedString?.characters.count)! < 1 {
                    translatedString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: self, comment: self)
                }
                return translatedString!
            }else{
                print("nil")
            }
            return ""
        }
    }
}
