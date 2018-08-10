import Foundation
import Quick
import Nimble

@testable import TDDPlayGround

class TestObjectSpec: QuickSpec {

	var testObject: TestObject?
	var firstNumber: Int?
	var secondNumber: Int?
	
	override func spec() {

		beforeEach() {
			self.testObject = TestObject()
			self.testObject?.swiftEnum = .none
			self.firstNumber = nil
			self.secondNumber = nil
		}

		describe("When I use whatIsMyNumber, I will put two numbers into the function")  {

			it("should be nil if one of the numbers is a nil value") {

				self.secondNumber = 3

				let result = self.testObject?.addTwoNumbers(numberOne: self.firstNumber, numberTwo: self.secondNumber)
				
				expect(result).to(beNil())
			}
			
			it("should add them together") {

			self.firstNumber = 3
			self.secondNumber = 4
				
				let result = self.testObject?.addTwoNumbers(numberOne: self.firstNumber, numberTwo: self.secondNumber)
				expect(result).to(equal(7))
			}
		}
		
		// descrive what the next set of tests does
		describe("When I use the creatStyledView function") {
			
			var testView: UIView?
			
			// set up the testView for each test
			beforeEach {
				testView = self.testObject?.createStyledView(view: UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
			}
			
			it("should return a view that is not nil") {
				expect(testView).toNot(beNil())
			}
			
			it("Should have a 2 pixel border, and be rounded by 5 points") {
				expect(testView?.layer.borderWidth).to(equal(2))
				expect(testView?.layer.cornerRadius).to(equal(5))
			}
			
			it("Should have a red background, and the border should be blue") {
				expect(testView?.backgroundColor).to(equal(UIColor.red))
				expect(testView?.layer.borderColor).to(equal(UIColor.blue.cgColor))
			}
		}
		
		describe("use a swift enum add number case to use whatIsMyNumber") {
			
			beforeEach {
				self.testObject?.swiftEnum = .addNumbers(firstNumber: 3, secondNumber: 4)
			}
			
			it("should make sure that the swiftyEnumTest is able to be used for the function") {

				expect(self.testObject?.swiftEnum).toNot(beNil())

				switch self.testObject?.swiftEnum {
				case .addNumbers(firstNumber: let first, secondNumber: let second)?:
					
					let result = self.testObject?.addTwoNumbers(numberOne: first, numberTwo: second)
					expect(result).to(equal(7))
				default:
					fail("It's not the correct case")
				}
			}
		}
		
		describe("Use the closureAddTwoNubers function to calculate the addition of two numbers") {
			
			it("should return nil if one of the numbers is nil") {
				
				self.firstNumber = 3
				
				self.testObject?.closureAddTwoNumbers(numberOne: self.firstNumber, numberTwo: self.secondNumber)  {
					
					expect($0).to(beNil())
				}
			}
			
			it("should return the correct value when the two numbers are added together") {
				
				self.firstNumber = 3
				self.secondNumber = 4
				
				self.testObject?.closureAddTwoNumbers(numberOne: self.firstNumber, numberTwo: self.secondNumber)  {
					
					expect($0).to(equal(7))
				}
			}
		}
		
		describe("When I instantiate a new object from the functionalAddTwoNumberUtility function") {
			
			var addNumbersUtility: ((Int?, Int?) -> Int?)?
			
			beforeEach {
				addNumbersUtility = self.testObject?.functionalAddTwoNumbersUtilitity()
			}
			
			it("should not be nil") {
				expect(addNumbersUtility).toNot(beNil())
			}
			
			it("should return the value of two numbers added together when used") {
				
				self.firstNumber = 3
				self.secondNumber = 4

				guard let addNumbersUtility = addNumbersUtility else {
				
					fail("This should have never happend if the test before this passed")
					return
				}
				
				let result = addNumbersUtility(self.firstNumber, self.secondNumber)
				
				expect(result).to(equal(7))
			}
		}
		
		describe("when I instatiate a new object from the createLocationOffsetUtility") {
			
			let createLocationOffsetUtility =  self.testObject?.createLocationOffsetUtility(offSet: 3.14)
			
			it("should return the correct Location Object with the correct offset values for X and Y when used") {
				
				let x: Float = 2
				let y: Float = 3
				
				if let createLocationOffsetUtility = createLocationOffsetUtility {
					
					let result = createLocationOffsetUtility(x, y, "My Location")
					
					expect(result != nil).to(beTrue())
					expect(result?.x).to(equal(5.14))
					expect(result?.y).to(equal(6.14))
					expect(result?.locationName).to(equal("My Location"))
				}
			}
		}
	}
}
