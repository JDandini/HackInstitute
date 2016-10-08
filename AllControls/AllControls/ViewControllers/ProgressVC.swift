//
//  ProgressVC.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/8/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class ProgressVC: UIViewController {

    @IBOutlet weak var lblProgress:UILabel!
    @IBOutlet weak var pvBar:UIProgressView!
    @IBOutlet weak var stpStepper:UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func stepperPressed(sender:UIStepper){
        let progressPercent =  String(format: "El progreso actual es de %.0f%%", sender.value * 100)
        lblProgress.text = progressPercent
        pvBar.progress = Float(sender.value)
    }
    
}
