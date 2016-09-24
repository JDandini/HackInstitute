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
    //MARK: IBActions
    @IBAction func sendPressed(sender:UIButton){
        self.closeKeyboard()
        //Crear mensaje
        var finalText = ""
        let greeting = greetingsArray[pvGreetingState.selectedRow(inComponent: 0)]
        let mood = moodStateArray[pvGreetingState.selectedRow(inComponent: 1)]
        finalText = greeting + " hoy me siento " +  mood
        // es lo mismo que finalText = finalText + " \(tfAdditionalComment.text!)"
        finalText += " \(tfAdditionalComment.text!)"
        //crear alerta
        let alert = UIAlertController(title: "Hola", message: finalText, preferredStyle: .alert)
        //Creando accion del alert
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //agregando accion al alert
        alert.addAction(okAction)
        //mostrando la alerta
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func sharePressed(sender:UIButton){
        self.closeKeyboard()
        var finalText = ""
        let greeting = greetingsArray[pvGreetingState.selectedRow(inComponent: 0)]
        let mood = moodStateArray[pvGreetingState.selectedRow(inComponent: 1)]
        finalText = greeting + " hoy me siento " +  mood
        //Compartir en redes sociales
        let shareImage = UIImage(named: "share")
        let shareSocial = UIActivityViewController(activityItems: [finalText,shareImage!], applicationActivities: [])
        let excludedActivities =  [UIActivityType.airDrop,
                                   UIActivityType.print,
                                   UIActivityType.assignToContact,
                                   UIActivityType.saveToCameraRoll,
                                   UIActivityType.addToReadingList,
                                   UIActivityType.postToFlickr,
                                   UIActivityType.postToVimeo]
        shareSocial.excludedActivityTypes = excludedActivities
        self.present(shareSocial, animated: true, completion: nil)
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
