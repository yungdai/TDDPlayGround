import Foundation
import Quick
import Nimble

@testable import TDDPlayGround

class TestObjectSpec: QuickSpec {

	var testObject: TestObject?
	
	override func spec() {

		beforeEach() {
			self.testObject = TestObject()
			self.testObject?.swiftEnum = .none
		}

		describe("When I use whatIsMyNumber, I will put two numbers into the function")  {
			
			var firstNumber: Int?
			var secondNumber: Int?

			it("should add them together") {

			firstNumber = 3
			secondNumber = 4
				
				let result = self.testObject?.addTwoNumbers(numberOne: firstNumber, numberTwo: secondNumber)
				expect(result).to(equal(7))
			}
			
			it("should not be nil if I add a nil value") {
				
				firstNumber = nil
				secondNumber = 3
				
				let result = self.testObject?.addTwoNumbers(numberOne: firstNumber, numberTwo: secondNumber)
				
				expect(result).toNot(beNil())
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
	}
}
