//
//  CountryDetailVC.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 9/24/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit

class CountryDetailVC: UIViewController {
    
    @IBOutlet weak var lblCountryName:UILabel!
    
    var selectedCountry:Country!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCountryName.text = "Estoy en \(selectedCountry.name)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
