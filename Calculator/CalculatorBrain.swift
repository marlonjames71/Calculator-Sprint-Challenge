//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
	case subtraction = "−"
	case multiplication = "×"
	case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
		if operatorType != nil {
			operand2String.append(contentsOf: digit)
			return operand2String
		} else {
			operand1String.append(contentsOf: digit)
			return operand1String
		}
    }
    
    func setOperator(_ operatorString: String) {
		if let opType = OperatorType(rawValue: operatorString) {
			operatorType = opType
		}
    }
    
    func calculateIfPossible() -> String? {
		if !operand1String.isEmpty,
			!operand2String.isEmpty,
			let opType = operatorType,
			let value1 = Double(operand1String),
			let value2 = Double(operand2String) {
				switch opType {
				case .addition:
					return String(value1 + value2)
				case .subtraction:
					return String(value1 - value2)
				case .multiplication:
					return String(value1 * value2)
				case .division:
					if value2 != 0 {
						return String(value1 / value2)
					} else {
						return "Error"
					}
				}
			}
        return nil
    }
}
