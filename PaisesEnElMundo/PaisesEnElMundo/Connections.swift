//
//  Connections.swift
//  PaisesEnElMundo
//
//  Created by F J Castaneda Ramos on 10/1/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit

class Connections: NSObject {
    let baseURL = "https://restcountries.eu/rest/v1/"
    
    func getCountriesForRegion(region:String,completion:@escaping (_ response:[[String:AnyObject]]?,_ error:NSError?)->Void){
        //Iniciamos un objeto para corroborar el status de la red
        let reachability = Reachability(hostName: "google.com")
        //Preguntamos por el status de la red
        let networkStatus = reachability?.currentReachabilityStatus()
        if networkStatus == NotReachable {
            //No hay internet, enviamos error al usuario
            let networkError = NSError(domain: "NOInternet", code: 400, userInfo: ["info":"No tenemos acceso a internet"])
            //ejecución del callback
            completion(nil, networkError)
            return
        }else{
            //hay internet
            //creamos enpoint
            let endPoint = "region/\(region)"
            //completamos la url https://restcountries.eu/rest/v1/region/\(region)
            let urlString = baseURL.appending(endPoint)
            //Verifcamos que la url sea correcta
            if let url = NSURL(string: urlString){
                // Generamos request al servidor
                let request =  NSMutableURLRequest(url: url as URL)
                // damos un tiempo de vida
                request.timeoutInterval = 15
                // Indicamos metodo http a usar
                request.httpMethod = "GET"
                // pasamos cabeceras que ocupamos
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                // Creamos proceso (hilo) de conexion
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    //Aqui se termina la conexion
                    data,responseURL,error in
                    //caso de error
                    if (error as? NSError) != nil{
                        completion(nil, (error as! NSError))
                    }else{
                        //no hubo error en la conexion
                        do{
                            // transformamos los datos en un arreglo de diccionarios
                            if let responseObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String:AnyObject]]{
                                completion(responseObj, nil)
                            }else{
                                let responseError = NSError(domain: "ResponseInvalid", code: 400, userInfo: ["info":"No existe este país"])
                                completion(nil, responseError)
                            }
                            
                        }catch let e as NSError{
                            //error al convertir datos en arreglo de diccionarios
                            completion(nil, e)
                        }
                    }
                }
                //ejecución de la conexión
                task.resume()
            }else{
                //URL mal formada hay que enviar al usuario el error
                let urlError = NSError(domain: "InvalidURL", code: 400, userInfo: ["info":"La URL es inválida"])
                completion(nil, urlError)
                return
            }
        }
        
    }
}
