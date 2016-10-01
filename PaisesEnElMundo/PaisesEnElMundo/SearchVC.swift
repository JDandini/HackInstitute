//
//  SearchVC.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 10/1/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var lblCountryName:UILabel!
    @IBOutlet weak var lblCapital:UILabel!
    @IBOutlet weak var lblCurrency:UILabel!
    @IBOutlet weak var lblArea:UILabel!
    @IBOutlet weak var lblPopulation:UILabel!
    @IBOutlet weak var ivCapital:UIImageView!
    @IBOutlet weak var ivCurrency:UIImageView!
    @IBOutlet weak var ivArea:UIImageView!
    @IBOutlet weak var ivPopulation:UIImageView!
    @IBOutlet weak var tfCountrySearch:UITextField!
    
    var country:Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func fillAllBlanks(){
        if let selectedCountry = self.country{
            let blueColor = UIColor.babyBlue()
            let size = CGSize(width: 30, height: 30)
            let imgCurrency = UIImage.fontAwesomeIconWithName(.USD, textColor: blueColor!, size: size)
            let imgPopulation =  UIImage.fontAwesomeIconWithName(.Users, textColor: blueColor!, size: size)
            let imgArea =  UIImage.fontAwesomeIconWithName(.ArrowsV, textColor: blueColor!, size: size)
            let imgCapital =  UIImage.fontAwesomeIconWithName(.MapPin, textColor: blueColor!, size: size)
            ivCurrency.image = imgCurrency
            ivCapital.image = imgCapital
            ivPopulation.image = imgPopulation
            ivArea.image = imgArea
            
            // Formater para miles
            let thousandsFormatter = NumberFormatter()
            thousandsFormatter.groupingSize = 3
            thousandsFormatter.groupingSeparator = ","
            thousandsFormatter.usesGroupingSeparator = true
            thousandsFormatter.decimalSeparator = "."
            thousandsFormatter.numberStyle = NumberFormatter.Style.decimal
            thousandsFormatter.maximumFractionDigits = 2
            // creacion de la cadena área ya formateada
            let areaStr = thousandsFormatter.string(from: NSNumber(integerLiteral: selectedCountry.area))
            // creacion de la cadena población ya formateada
            let populationStr = thousandsFormatter.string(from: NSNumber(integerLiteral: selectedCountry.population))
            
            // Iterar por cada moneda en el arreglo de monedas
            var currenciesStr = ""
            for currency in selectedCountry.currencies{
                
                if currency != selectedCountry.currencies.last{
                    // si no es la última del arreglo
                    currenciesStr += " \(currency),"
                }else{
                    // si  es la última del arreglo
                    currenciesStr += " \(currency)."
                }
                
            }
            // llenado de las labels
            lblCountryName.text = "Estoy en \(selectedCountry.name)"
            lblArea.text = "Área: \(areaStr!) metros cuadrados"
            lblCapital.text = "Capital: \(selectedCountry.capital)"
            lblPopulation.text = "Población: \(populationStr!) habitantes"
            lblCurrency.text = "Moneda(s):\(currenciesStr)"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
