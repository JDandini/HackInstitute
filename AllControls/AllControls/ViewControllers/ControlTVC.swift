//
//  ControlTVC.swift
//  AllControls
//
//  Created by F J Castaneda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class ControlTVC: UITableViewController {
    
    var controlList:[Control]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlList = []
        if let filePath = Bundle.main.path(forResource: "Controls", ofType: "plist"){
            let array = NSArray(contentsOfFile: filePath) as! [[String:String]]
            for controlDic in array{
                if let control = Control.controlFromDic(controlDic: controlDic){
                    controlList.append(control)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controlList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let control = controlList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ControlCell", for: indexPath) as! ControlTVCell
        cell.ivControlIcon.image = UIImage(named:control.imageName)
        cell.lblControlName.text = control.title
        cell.lblControlSubtitle.text = control.subtitle
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let control = controlList[indexPath.row]
        self.performSegue(withIdentifier: control.segue, sender: self)
    }

}
