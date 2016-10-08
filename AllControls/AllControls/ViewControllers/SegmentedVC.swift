//
//  SegmentedVC.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class SegmentedVC: UIViewController {
    
    @IBOutlet weak var svSlider:UISlider!
    @IBOutlet weak var scCurrency:UISegmentedControl!
    @IBOutlet weak var swIsOn:UISwitch!
    @IBOutlet weak var lblSegmented:UILabel!
    @IBOutlet weak var lblSlider:UILabel!
    @IBOutlet weak var lblSwitch:UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func sliderChanged(sender:UISlider){
        lblSlider.text = "El valor actual del slider es: \(sender.value)"
    }
    
    @IBAction func segmentedChanged(sender:UISegmentedControl){
        var currencyText = "La moneda seleccionada es: "
        switch sender.selectedSegmentIndex {
        case 0:
            currencyText += "USD"
            break
        case 1:
            currencyText += "MX Peso"
            break
        default:
            currencyText += "Euro"
            break
        }
        lblSegmented.text = currencyText
    }
    
    @IBAction func switchChanged(sender:UISwitch){
        lblSwitch.text = sender.isOn ? "El switch está encendido":"El switch está apagado";
    }

}
