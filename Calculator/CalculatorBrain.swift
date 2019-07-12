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
			return onlyAllowOneDecimal(digit, &operand2String)
		} else {
			return onlyAllowOneDecimal(digit, &operand1String)
		}
    }
    
    func setOperator(_ operatorString: String) {
		if let opType = OperatorType(rawValue: operatorString) {
			operatorType = opType
		}
    }
    
    func calculateIfPossible() -> String? {
		let output: Double
		if !operand1String.isEmpty,
			!operand2String.isEmpty,
			let opType = operatorType,
			let value1 = Double(operand1String),
			let value2 = Double(operand2String) {
				switch opType {
				case .addition:
					output = value1 + value2
					return output.removeZerosFromEnd()
				case .subtraction:
					output = value1 - value2
					return output.removeZerosFromEnd()
				case .multiplication:
					output = value1 * value2
					return output.removeZerosFromEnd()
				case .division:
					if value2 != 0 {
						output = value1 / value2
						return output.removeZerosFromEnd()
					} else {
						return "Error"
					}
				}
			}
        return nil
    }
	
	private func onlyAllowOneDecimal(_ userInput: String, _ operandStr: inout String) -> String {
		if userInput == "." && operandStr.contains(".") {
			operandStr.append(contentsOf: "")
		} else {
			operandStr.append(contentsOf: userInput)
		}
		return operandStr
	}
}

extension Double {
	func removeZerosFromEnd() -> String {
		let formatter = NumberFormatter()
		let number = NSNumber(value: self)
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 16
		return String(formatter.string(from: number) ?? "")
	}
}
