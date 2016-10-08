//
//  Control.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class Control: NSObject {
    let title:String
    let subtitle:String
    let imageName:String
    let segue:String
    
    init(title:String,subtitle:String,imageName:String,segue:String) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.segue = segue
    }
    
    class func controlFromDic(controlDic:[String:String])->Control?{
        if let title = controlDic["title"],
            let subtitle = controlDic["subtitle"],
            let imageName = controlDic["image"],
            let segue = controlDic["segue"]{
                return Control(title: title, subtitle: subtitle, imageName: imageName, segue: segue)
        }
        return nil
    }
}
