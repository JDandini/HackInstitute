//
//  CountriesTVC.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 9/24/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit

class CountriesTVC: UITableViewController {

    var countriesArray:[Country]!
    var selectedCpuntry:Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesArray = []
        //Obtención de el path del archivo Countries.plist
        if let filePath = Bundle.main.path(forResource: "Countries", ofType: "plist"){
            //Inicializar arreglo con el contenido del archivo
            let tmpArray = NSArray(contentsOfFile: filePath)
            //Conversion de NSArray -> arreglo del tipo [[String:AnyObject]]
            let countriesRaw = tmpArray as! [[String:AnyObject]]
            //Creación de datos tipo Country
            for countryDic in countriesRaw{
                if let country =  Country.countryFromDictionary(countryDic: countryDic){
                    countriesArray.append(country)
                }
            }
            countriesArray =  countriesArray.sorted{$0.name < $1.name}
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Reviso que el destinatario sea del tipo CountryDetailVC
        if segue.destination is CountryDetailVC{
            //hago conversion de UIViewController a CountryDetailVC
            let detail =  segue.destination as! CountryDetailVC
            //Le pasamos el país
            detail.selectedCountry = selectedCpuntry
        }
    }
    
}

extension CountriesTVC{
    // MARK: - Table view data source
    //  Metodo que dice el número de secciones en la tabla
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //  Metodo que dice el número de renglones por sección
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    //  Metodo que crea la celda en la sección y en el renglón
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Indicamos a la tabla que usaremos una celda con el identificador "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // Si aún no hay una celda con el identicador Cell se crea una celda nueva
        if cell == nil{
            cell =  UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        // Hacemos referencia al país en esa posición
        let country = countriesArray[indexPath.row]
        // le pasamos el nombre a la celda
        cell?.textLabel?.text = country.name
        //regresamos la celda
        return cell!
    }
    //Método que se ejecuta cuando se toca una celda
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //despintamos la celda
        tableView.deselectRow(at: indexPath, animated: true)
        //Seleccionamos un país
        selectedCpuntry = countriesArray[indexPath.row]
        //hacemos la transición
        self.performSegue(withIdentifier: "Detail", sender: self)
    }
}
