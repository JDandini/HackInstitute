//
//  CountriesTVC.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 9/24/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit
import KVNProgress

class CountriesTVC: UITableViewController {

    var countriesArray:[Country]!
    var selectedCountry:Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Paises"
        countriesArray = []
        // Creación de instancia de objeto de connexiones
        KVNProgress.show()
        let connect = Connections()
        // llamada a obtener paises
        connect.getCountriesForRegion(region: "europe") { (countriesArray, error) in
            // termina la conexión
            if let e = error, let desE = e.userInfo["info"] as? String{
                // caso de error mostramos alerta al usuario
                KVNProgress.dismiss()
                let alertError = UIAlertController(title: "OH NO!", message: desE, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertError.addAction(okAction)
                self.present(alertError, animated: true, completion: nil)
            }else if let e = error{
                KVNProgress.dismiss()
                let alertError = UIAlertController(title: "OH NO!", message: e.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertError.addAction(okAction)
                self.present(alertError, animated: true, completion: nil)
            }else if let rawArray = countriesArray{
                // no hay error entonces llenamos arreglo de paises
                for dicCountry in rawArray{
                    if let country = Country.countryFromDictionary(countryDic: dicCountry){
                        self.countriesArray.append(country)                        
                    }
                }
                self.tableView.reloadData()
                KVNProgress.showSuccess(withStatus: "¡Exito!")
            }
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
            detail.selectedCountry = selectedCountry
        }
    }
    
}
// MARK: - Table view data source
extension CountriesTVC{
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
        selectedCountry = countriesArray[indexPath.row]
        //hacemos la transición
        self.performSegue(withIdentifier: "Detail", sender: self)
    }
}
