//
//  names.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/24/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import Foundation

//this is an object class to create DailyTheo Objects which essentially are objects containing a name,quote,if its favorited,and the topic

class dailyTheoObject: NSObject{
    var theoname: String = ""
    var theoquote: String = ""
    var favorited: Bool = false
    var topic: String = ""
  
    
    init(name: String = "", quote: String = "", favorited: Bool, nametopic: String = ""){
        self.theoname = name
        self.theoquote = quote
        self.favorited = favorited
        self.topic = nametopic
    }
    
}
