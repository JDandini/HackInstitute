//
//  Townships.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class Township: NSObject {
    let id:Int
    let name:String
    init(id:Int, name:String) {
        self.name = name
        self.id = id
    }
    
    class func townshipFromDic(town:[String:AnyObject])->Township?{
        if let id = town["id"] as? Int  , let name = town["nombre"] as? String{
            return Township(id: id, name: name)
        }
        return nil
    }
}
