//
//  TestObject.swift
//  TDDPlayGround
//
//  Created by Yung Dai on 2018-08-05.
//  Copyright © 2018 Yung Dai. All rights reserved.
//

import UIKit

// Custom Swift Enum that is equatable for testing
public enum SwiftEnum {

	case none
	case tuple(intValue: Int?, boolValue: Bool?, stringValue: String?)
	case addNumbers(firstNumber: Int?, secondNumber: Int?)
}

// impliment equatable for the switch value
extension SwiftEnum: Equatable {
	
	public static func == (lhs: SwiftEnum, rhs: SwiftEnum) -> Bool {
		
		switch (lhs, rhs) {
		case (.none, .none):
			return true
			
		case (.tuple(let intValue1, let boolValue1, let stringValue1), .tuple(let intValue2, let boolValue2, let stringValue2)):
			return (intValue1, boolValue1, stringValue1) == (intValue2, boolValue2, stringValue2)
			
		case (.addNumbers(let firstNumber1, let secondNumber1), .addNumbers(let firstNumber2, let secondNumber2)):
			return (firstNumber1, secondNumber1) == (firstNumber2, secondNumber2)
			
		default:
			return false
		}
	}
}


struct TestObject {
	
	var swiftEnum: SwiftEnum = .none

	func addTwoNumbers(numberOne: Int?, numberTwo: Int?) -> Int {
		
		guard let numberOne = numberOne,
			let numberTwo = numberTwo else { return 0 }
		return numberOne + numberTwo
	}
	
	func createStyledView(view: UIView) -> UIView? {
		
		view.layer.borderWidth = 2
		view.layer.cornerRadius = 5
		
		view.backgroundColor = UIColor.red
		view.layer.borderColor = UIColor.blue.cgColor
		
		return view
	}
}


