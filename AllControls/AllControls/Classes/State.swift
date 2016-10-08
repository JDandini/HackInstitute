//
//  State.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class State: NSObject {
    let name:String
    let id:Int
    let capital:String
    let townships:[Township]
    
    init(name:String, id:Int, capital:String, townships:[Township]) {
        self.name =  name
        self.id = id
        self.capital = capital
        self.townships = townships
    }
    
    class func stateFormDic(state:[String:AnyObject])->State?{
        if let id = state["id"] as? Int,
        let capital = state["capital"] as? String,
        let name = state["nombre"] as? String{
            var townships:[Township] = []
            if let townshipsDic = state["municipios"] as? [String:AnyObject], let townshipsArrayRaw = townshipsDic["municipio"] as? [[String:AnyObject]]{
                for townDic in townshipsArrayRaw{
                    if let town = Township.townshipFromDic(town: townDic){
                        townships.append(town)
                    }
                }
            }
            return State(name: name, id: id, capital: capital, townships: townships)
        }
        
        return nil
    }
}
