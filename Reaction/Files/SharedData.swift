//
//  SharedData.swift
//  Reaction
//
//  Created by Nathan Gendler on 5/22/23.
//

import Foundation

class SharedVariables {
    static var score = 400.0
    static var high1 = 0
    static var high2 = 0.0
    
//    var myVariable: Any?
}
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


