//
//  userLoginData.swift
//  fourthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/14.
//

import Foundation

struct userLoginData {
    var name : String
    var part : String
    
    
    init()
    {
        name = ""
        part = ""
    }
    
    init(name : String, part : String)
    {
        self.name = name
        self.part = part
    }
}

