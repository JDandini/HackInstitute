//
//  Country.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 9/24/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit

class Country: NSObject {
    let name:String
    let id:Int
    var countryDesc:String?
    
    init(name:String, id:Int, descrip:String?) {
        self.id = id
        self.name = name
        self.countryDesc = descrip
    }
    
    class func countryFromDictionary(countryDic:[String:AnyObject])->Country?{
        if  let id = countryDic["identifier"] as? Int,
            let name = countryDic["name"] as? String{
            var descrip:String?
            if let desc = countryDic["description"] as? String{
                descrip = desc
            }
                return Country(name: name, id: id, descrip: descrip)
        }
        
        return nil
    }
}
