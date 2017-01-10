//
//  Locale.swift
//  LocalizeStringDemo
//
//  Created by Kokpheng on 1/10/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import Foundation

// Locale Model class
class Locale : NSObject, NSCoding{
    var languageName : String
    var languageCode : String
    
    init(languageCode : String, languageName : String) {
        self.languageCode = languageCode
        self.languageName = languageName
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.languageName = aDecoder.decodeObject(forKey: "languageName") as! String
        self.languageCode = aDecoder.decodeObject(forKey: "languageCode") as! String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.languageName, forKey: "languageName")
        aCoder.encode(self.languageCode, forKey: "languageCode")
    }
}
