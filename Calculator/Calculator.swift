//
//  Calculator.swift
//  Calculator
//
//  Created by user193216 on 10/1/21.
//

import Foundation

class Calculator {
    
    var inputData: [String] = []
    
    func push(s:String) {
        inputData.append(s)
    }
    
    func calc()->Float {
        var result : Float = 0;
        var i : Int = 0;
        var num1 : Float?
        var num2 : Float?
        var op : String?
        
        while(i < inputData.count) {
            if let input = Int(inputData[i]) {
                i += 1
                continue
            } else {
                if num1 == nil {
                num1 = Float(inputData[i-1])
                }
                
                op = inputData[i]
                num2 = Float(inputData[i+1])
                
                result = compute(n1: num1!, op: op!, n2: num2!)
                num1 = result
                i += 2
            }
            
            
        }
        return result
    }
    
    func compute(n1:Float, op:String, n2:Float)->Float {
        
        switch (op) {
            case "+" :
                return n1 + n2
                break
            case "-" :
                return n1 - n2
                break
            case "*" :
                return n1 * n2
                break
            case "/" :
                return n1 / n2
                break
            default :
                return 0
                break
        }
    }
    
    func validate()->Bool {
        if inputData.count < 2 || (inputData.count%2) == 0 {
            return false
        }
        
        var i : Int = 0;
        while(i < inputData.count) {
            if let n1 = Int(inputData[i]) {
                if i+1 < inputData.count {
                    if let n2 = Int(inputData[i+1]) {
                        return false
                    } else {
                        i += 2
                        continue
                    }
                }
                break
            } else {
                return false
            }
            
        }
        return true
    }
    
    
    func clear() {
        inputData = []
    }
    
}
