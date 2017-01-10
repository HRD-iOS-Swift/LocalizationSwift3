//
//  LanguageManager.swift
//  LocalizeStringDemo
//
//  Created by Kokpheng on 1/10/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import Foundation

class LanguageManager {
    // shared instance
    static let shared = LanguageManager()
    
    var availableLocales : [Locale]
    
    private init() {
        let english = Locale(languageCode: "en", languageName:"English")
        let khmer = Locale(languageCode: "km", languageName:"Khmer")
        
        self.availableLocales = [english, khmer];
    }
    
    // Compute property of language
    var language: Locale {
        set {
            // Convert user define class to Data for adding to UserDefaults
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            UserDefaults.standard.set(data, forKey: "LanguageCode")
            UserDefaults.standard.synchronize()
        }
        get {
            var selectedLocale : Locale? = nil
            
            // check if object of key LanguageCode availabel in UserDefaults or not
            if let data = UserDefaults.standard.object(forKey: "LanguageCode") {
                
                // Decode object in UserDefaults to user define class back
                let locale = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Locale
                
                // Get currect languageCode
                let languageCode = locale.languageCode.lowercased()
                
                // find locale which is match to currect languageCode
                for locale in self.availableLocales{
                    if locale.languageCode.caseInsensitiveCompare(languageCode) == ComparisonResult.orderedSame {
                        selectedLocale = locale
                        break
                    }
                }
            }else{
                print("nil")
            }
            return selectedLocale!
        }
    }
}

