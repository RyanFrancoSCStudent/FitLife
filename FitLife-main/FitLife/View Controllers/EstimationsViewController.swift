//
//  EstimationsViewController.swift
//  FitLife
//
//  Created by Ryan Franco on 2026-11-27.
//

import UIKit


// this class handles the estimation for the estimated daily calories page
class EstimationsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //returns number of levels
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityLevels.count
    }
    
    
   // handles weight text field
    @IBOutlet var weightTextField: UITextField!
    //handles height text field
    @IBOutlet var heightTextField: UITextField!
    //handles activity picker using UIPicker View
    @IBOutlet var activityPicker : UIPickerView!
    //holdes the calculated result to the label
    @IBOutlet var calorieLabel: UILabel!
    
    //predefined list for the picker
    var activityLevels = ["Sedentry", "Light Active", "Moderate Active", "Very Active", "Extremely Active"]
    
   //returns number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
 //instanciantes the swift class CalorieCalculate for the Calulations
    var calculator = CalorieCalulate()
    
    
    //displays row by row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityLevels[row]
    }
    
    
    //does calculations
    @IBAction func calculateButton(_ sender: UIButton){
        let weight = Double(weightTextField.text ?? "")!
        let height = Double(heightTextField.text ?? "")!
        
        
        let activity = activityPicker.selectedRow(inComponent: 0)
        
        //validates calulations and makes sure theres no invaild entrys
        if weight > 0 && height > 0{
            
            
            let calories = calculator.calculateCalories(weight: weight, height: height, activity: activity)
            
            
            calorieLabel.text = String(Int(calories)) + "Kcal"
            
        }
        else {
            calorieLabel.text = "invaild input"
            
        }
        
        
        
        
    }
//runs when application starts
    override func viewDidLoad() {
        super.viewDidLoad()

        //initailizes the picker when the page loads from the viewDidLoad at startup
        activityPicker.delegate = self
        activityPicker.dataSource = self
    }
    

   

}
