//
//  names.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/24/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import Foundation


class dailyTheoObject: NSObject{
    var theoname: String = ""
    var theoquote: String = ""
    var favorited: Bool = false
  
    
    init(name: String = "", quote: String = "", favorited: Bool){
        self.theoname = name
        self.theoquote = quote
        self.favorited = favorited
    }
    
}
