//
//  ViewController.swift
//  Calculadora de edad Perruna
//
//  Created by Eduardo D De La Cruz Marr on 18/1/17.
//  Copyright © 2017 Eduardo D De La Cruz Marrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var yearsText: UITextField!
    @IBOutlet var monthsText: UITextField!
    @IBOutlet var sizeSegmented: UISegmentedControl!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton)
    {
        
        //******************** Validaciones de datos en los textfields ***********************//
        
        if monthsText.text == ""
        {
            monthsText.text = "0"
        }
        if yearsText.text == ""
        {
            yearsText.text = "0"
        }
        if Double(monthsText.text!)! > 11
        {
            let alert : UIAlertController = UIAlertController(title: "Que pena REVISA!!!", message : "El valor de mes no puede ser mayor de 11 " , preferredStyle: .alert)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated : true, completion : nil)
        }
        if monthsText.text == "0" && yearsText.text == "0"
        {
            let alert : UIAlertController = UIAlertController(title: "Que pena REVISA!!!", message : "Debes rellenar año o mes para calcular" , preferredStyle: .alert)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated : true, completion : nil)
        }
        
        //**************** Validaciones de edad humana y tamaño de la raza con calculos **************************//
    
        let humanAge : Double = Double(yearsText.text!)! + (Double(monthsText.text!)! / 12)
        var commonAge : Double = 39
        let addSmall : Double = 4
        let addMedium : Double = 6
        let addBig : Double = 7
        
        if humanAge <= 1
        {
            let dogYears : String = String(Int(humanAge * 16))
            let dogMonths : String = String(Int(((humanAge * 16) - Double(Int(humanAge * 16))) * 12))
            
            alert(years: dogYears, months: dogMonths)
        }
        else if humanAge > 1 && humanAge <= 2
        {
            let dogYears : String = String(Int(16 + (humanAge - 1) * 8))
            let dogMonths : String = String(Int((((humanAge - 1) * 8) - Double(Int((humanAge - 1) * 8))) * 12))
            
            alert(years: dogYears, months: dogMonths)
        }
        else if humanAge > 2 && humanAge <= 3
        {
            let dogYears : String = String(Int(24 + (humanAge - 2) * 5))
            let dogMonths : String = String(Int((((humanAge - 2) * 5) - Double(Int((humanAge - 2) * 5))) * 12))
            
            alert(years: dogYears, months: dogMonths)
        }
        else if humanAge > 3 && humanAge <= 4
        {
            let dogYears : String = String(Int(29 + (humanAge - 3) * 5))
            let dogMonths : String = String(Int((((humanAge - 3) * 5) - Double(Int((humanAge - 3) * 5))) * 12))
            
            alert(years: dogYears, months: dogMonths)
        }
        else if humanAge > 4 && humanAge <= 5
        {
            let dogYears : String = String(Int(34 + (humanAge - 4) * 5))
            let dogMonths : String = String(Int((((humanAge - 4) * 5) - Double(Int((humanAge - 4) * 5))) * 12))
            
            alert(years: dogYears, months: dogMonths)
        }
        else if humanAge > 5
        {
            if sizeSegmented.selectedSegmentIndex == 0
            {
                commonAge = commonAge + (addSmall * Double(Int(humanAge - 6)))
                
                let dogYears : String = String(Int(commonAge + (humanAge - (((commonAge - 39) / addSmall) + 5)) * addSmall))
                let dogMonths : String = String(Int((((humanAge - (((commonAge - 39) / addSmall) + 5)) * addSmall) - Double(Int((humanAge - (((commonAge - 39) / addSmall) + 5)) * addSmall))) * 12))
                
                alert(years: dogYears, months: dogMonths)
                
                commonAge = 39
            }
            else if sizeSegmented.selectedSegmentIndex == 1
            {
                commonAge = commonAge + (addMedium * Double(Int(humanAge - 6)))
                
                let dogYears : String = String(Int(commonAge + (humanAge - (((commonAge - 39) / addMedium) + 5)) * addMedium))
                let dogMonths : String = String(Int((((humanAge - (((commonAge - 39) / addMedium) + 5)) * addMedium) - Double(Int((humanAge - (((commonAge - 39) / addMedium) + 5)) * addMedium))) * 12))
                
                alert(years: dogYears, months: dogMonths)
                
                commonAge = 39
            }
            else
            {
                commonAge = commonAge + (addBig * Double(Int(humanAge - 6)))
                
                let dogYears : String = String(Int(commonAge + (humanAge - (((commonAge - 39) / addBig) + 5)) * addBig))
                let dogMonths : String = String(Int((((humanAge - (((commonAge - 39) / addBig) + 5)) * addBig) - Double(Int((humanAge - (((commonAge - 39) / addBig) + 5)) * addBig))) * 12))
                
                alert(years: dogYears, months: dogMonths)
                
                commonAge = 39
            }
        }
    }
    
    // ********************** Funcion que envia el alerta del calculo de la edad *************************//
    
    func alert(years : String , months : String)
    {
        let alert : UIAlertController = UIAlertController(title: "Edad calculada", message : "La edad de tu perro es: " + years + " años y " + months + " meses humanos" , preferredStyle: .alert)
        
        let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated : true, completion : nil)
        
        monthsText.text = ""
        yearsText.text = ""
    }
}
