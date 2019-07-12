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
		if operatorType == nil {
			operand1String.append(contentsOf: digit)
			return operand1String
		} else {
			operand2String.append(contentsOf: digit)
			return operand2String
		}
    }
    
    func setOperator(_ operatorString: String) {
		if operatorString == OperatorType.addition.rawValue {
			operatorType = .addition
		} else if operatorString == OperatorType.subtraction.rawValue {
			operatorType = .subtraction
		} else if operatorString == OperatorType.multiplication.rawValue {
			operatorType = .multiplication
		} else {
			operatorType = .division
		}
    }
    
    func calculateIfPossible() -> String? {
		var output: Double
		guard let opType = operatorType else { return nil }
		if operand1String != "" && operand2String != "" {
			guard let value1 = Double(operand1String) else { return nil }
			guard let value2 = Double(operand2String) else { return nil }
			switch opType {
			case .addition:
				output = value1 + value2
				return String(output)
			case .subtraction:
				output = value1 - value2
				return String(output)
			case .multiplication:
				output = value1 * value2
				return String(output)
			case .division:
				output = value1 / value2
				return String(output)
			}
		}
        return "Error go away"
    }
}
