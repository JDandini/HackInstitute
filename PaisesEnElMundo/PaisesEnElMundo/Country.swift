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
    let code:String
    let capital:String
    let region:String
    let population:Int
    let area:Int
    let currencies:[String]
    let languages: [String]
    
    
    init(name:String,code:String,capital:String,region:String,population:Int, area:Int, currencies:[String], languages:[String] ) {
        self.name = name
        self.code = code
        self.capital = capital
        self.region = region
        self.population = population
        self.area = area
        self.currencies = currencies
        self.languages = languages
    }
    
    class func countryFromDictionary(countryDic:[String:AnyObject])->Country?{
        if let name = countryDic["name"] as? String,
            let code = countryDic["alpha2Code"] as? String,
            let capital = countryDic["capital"] as? String,
            let region = countryDic["region"] as? String,
            let population = countryDic["population"] as? Int,
            let area =  countryDic["area"] as? Int,
            let currencies = countryDic["currencies"] as? [String],
            let languages = countryDic["languages"] as? [String]{
            
                return Country(name:name,code:code,capital:capital,region:region,population:population, area:area, currencies:currencies, languages:languages )
        }
        
        return nil
    }
}
