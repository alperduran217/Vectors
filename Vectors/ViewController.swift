//
//  ViewController.swift
//  Vectors
//
//  Created by Mehmet Alper Duran on 21.02.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rXarr:[Double] = []
    var rYarr:[Double] = []
    var rX = 0.0;
    var rY = 0.0;
    var rV = 0.0;
    var forceArray:[Double] = []
    var degreeArray:[Double] = []
    var cosX:Double = 0.0
    var sinY:Double = 0.0
    var roundedresult = 0.0
    var roundedresult2 = 0.0
    func radiansToDegrees (radians: Double)->Double {
        return radians * M_PI / 180
    }
    

    @IBAction func minusSymbol(sender: AnyObject) {
        forceField.text = "-"
    }
    @IBAction func rootSymbol(sender: AnyObject) {
        forceField.text = "√"
    }
    @IBOutlet weak var viewDegree: UILabel!
    @IBOutlet weak var viewForce: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBAction func clearFunc(sender: AnyObject) {
        forceArray.removeAll()
        degreeArray.removeAll()
        forceField.text = nil
        degreeField.text = nil
        rXarr.removeAll()
        rYarr.removeAll()
        resultLbl.text = nil
        viewForce.text = nil
        rY=0.0
        rX=0.0
        cosX=0.0
        sinY=0.0
        roundedresult=0.0
        roundedresult2=0.0
        rV=0.0
        
    }
    @IBAction func addForce(sender: AnyObject) {
        guard let theText = forceField.text where !forceField.text!.isEmpty else {
           viewForce.text = "Must enter values to the empty spaces"
            return
        }
        print("user wrote \(theText)")
       
        if forceField.text!.rangeOfString("√") != nil {
        let sliced = String(forceField.text!.characters.dropFirst())
        forceArray.append(sqrt(Double(sliced)!))
        
            forceField.text = nil }
        
        else {
            forceArray.append(Double(forceField.text!)!)
            
            forceField.text = nil
        }
        degreeArray.append(Double(degreeField.text!)!)
       
        degreeField.text = nil
        
        for var i=0 ; i<forceArray.count; i++ {
            
            var roundresult = 0.0
            roundresult = Double(String(format:"%.3f", forceArray[i]))!

            viewForce.text = "\(i+1). Vector = \(roundresult) N, \(degreeArray[i]) ° \n"
        }
    }
 
    
   
    @IBAction func findResult(sender: AnyObject) {
        if forceArray.count == degreeArray.count {
            for var i=0; i<forceArray.count; i++ {
                
        
                cosX = cos(radiansToDegrees(degreeArray[i]))
                rXarr += [forceArray[i]*cosX]
                sinY = sin(radiansToDegrees(degreeArray[i]))
                rYarr += [forceArray[i]*sinY]
                
            }
            
            for var j=0; j<rXarr.count; j++ {
                rX += rXarr[j]
                rY += rYarr[j]
            }
            var result = 0.0
            var result2 = 0.0
            result=sqrt(rX*rX+rY*rY)
            var x = 0.0
            
            x=rY/rX
            
            result2 = atan(x) * (180 / M_PI)
            
           

            
            roundedresult = Double(String(format:"%.3f", result))!
            roundedresult2 = Double(String(format:"%.3f", result2))!


            
            
            
            resultLbl.text = "R Vector = \(roundedresult) N, \(roundedresult2) °"
            
        }
        else {
             resultLbl.text = "Force and magnitude values must be equal"
        }
        
        
    }
   
    @IBOutlet weak var forceField: UITextField!
    @IBOutlet weak var degreeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

