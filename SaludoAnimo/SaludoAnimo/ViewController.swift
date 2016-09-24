//
//  ViewController.swift
//  SaludoAnimo
//
//  Created by F J Castaneda Ramos on 9/24/16.
//  Copyright © 2016 Hack Institute. All rights reserved.
//

import UIKit
//MARK:- Class definition ViewController
class ViewController: UIViewController {

    @IBOutlet weak var pvGreetingState:UIPickerView!
    @IBOutlet weak var tfAdditionalComment:UITextField!
    @IBOutlet weak var btnSend:UIButton!
    
    var moodStateArray:[String]!
    var greetingsArray:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicialización de variables
        moodStateArray = ["Cansado","Feliz","Aburrido","Triste", "Devastado","Alegre","Motivado"]
        greetingsArray = ["Hola","Que onda", "Mucho gusto","'Sup"]
        //Reaccion al toque de la pantalla
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Metodo para quitar el teclado
     func closeKeyboard(){
        tfAdditionalComment.resignFirstResponder()
    }
}
//MARK:- UIPickerViewDataSource,UIPickerViewDelegate Methods
extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    //Metodo que dice cuantas columnas tengo en el picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //Metodo que dice cuantos renglones por columna tengo en el picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == 0) ? greetingsArray.count : moodStateArray.count
    }
    //Metodo que dice qué texto tengo en cada renglon en cada columna en el picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == 0) ?  greetingsArray[row] : moodStateArray[row]
    }
    
}
//MARK:- UITextFieldDelegate Methods
extension ViewController:UITextFieldDelegate{
    // metodo que reacciona al tocar la tecla enter en el teclado del iPhone
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
