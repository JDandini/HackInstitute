//
//  PickerVC.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class PickerVC: UIViewController {
    
    @IBOutlet weak var pvStates:UIPickerView!
    @IBOutlet weak var lblILiveIn:UILabel!
    
    var states:[State]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        states = []
        if let pathFile = Bundle.main.path(forResource: "states", ofType: "json"){
            
            do{
                let data = try Data(referencing: NSData(contentsOfFile: pathFile))
                if  let mexicoObj =  try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject],
                    let country = mexicoObj["mexico"] as? [String:AnyObject],
                    let statesArray =  country["estado"] as? [[String:AnyObject]]{
                    for stateDic in statesArray{
                        if let state = State.stateFormDic(state: stateDic){
                            states.append(state)
                        }
                    }
                }
            }catch let e as NSError{
                let alertError = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                let okAction  =  UIAlertAction(title: "OK", style: .default, handler: nil)
                alertError.addAction(okAction)
                self.present(alertError, animated: true, completion: nil)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PickerVC:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let state = states[row]
        return state.name.capitalized
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let state = states[row]
        lblILiveIn.text = "Vivo en \(state.name.capitalized)"
        
    }
    
}
