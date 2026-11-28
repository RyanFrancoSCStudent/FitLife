//
//  CalorieCalulate.swift
//  FitLife
//
//  Created by Ryan Franco on 2026-11-27.
//

import Foundation
//class does calculation for calries
class CalorieCalulate{
    
    //passes the text field data
    func calculateCalories(weight:Double, height: Double, activity:Int) -> Double{
        
        
        
        if weight > 0 && height > 0 {
            
            var multiplier = 1.2
            
            //changes based on the level of activity
            if activity == 1 {
                multiplier = 1.375
            } else if activity == 2 {
                multiplier = 1.55
            } else if activity == 3 {
                multiplier = 1.725
            } else if activity == 4 {
                multiplier = 1.9
            }
            
            return (10 * weight + 6.2 * height) * multiplier
        }
        return 0 
    }
}
