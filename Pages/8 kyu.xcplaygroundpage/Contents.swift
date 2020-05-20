//: [Previous](@previous)

import Foundation
import XCTest

/*:
 # Even or Odd
 Create a function (or write a script in Shell) that takes an integer as an argument and returns "Even" for even numbers or "Odd" for odd numbers.*/

func evenOrOdd(_ number:Int) -> String {
  return number % 2 == 0 ? "Even": "Odd"
}

/*:
 # Transportation on vacation
 After a hard quarter in the office you decide to get some rest on a vacation. So you will book a flight for you and your girlfriend and try to leave all the mess behind you.

 You will need a rental car in order for you to get around in your vacation. The manager of the car rental makes you some good offers.

 Every day you rent the car costs $40. If you rent the car for 7 or more days, you get $50 off your total. Alternatively, if you rent the car for 3 or more days, you get $20 off your total.

 Write a code that gives out the total amount for different days(d).
 */

func getDiscount(for days: Int)-> Int {
    if days >= 7 {
        return 50
    } else if days >= 3 {
        return 20
    } else {
        return 0
    }
}

func RentalCarCost(_ days: Int) -> Int {
  let discount = getDiscount(for: days)
  let total = (days * 40) - discount
  
  return total
}
/*:
 # Sum of positive
 You get an array of numbers, return the sum of all of the positives ones.

 ```Example [1,-4,7,12] => 1 + 7 + 12 = 20```

 Note: if there is nothing to sum, the sum is default to 0.
*/

func sumOfPositives (_ numbers: [Int] ) -> Int {
    return   numbers.reduce(0) {
        $1 > 0 ? $0 + $1 : $0
    }
}

/*:
## Unit tests
The unit tests for Even or Odd  and Transportation on vacation exercise
 
*/

class TestSuite: XCTestCase {
    
    func testEvenOrOdd() {
        XCTAssertEqual(evenOrOdd(2),"Even")
        XCTAssertEqual(evenOrOdd(0),"Even")
        XCTAssertEqual(evenOrOdd(7),"Odd")
        XCTAssertEqual(evenOrOdd(1),"Odd")
    }
    
    func testRentaCarCost() {
      XCTAssertEqual(RentalCarCost(1), 40)
      XCTAssertEqual(RentalCarCost(2), 80)
      XCTAssertEqual(RentalCarCost(3), 100)
      XCTAssertEqual(RentalCarCost(4), 140)
      XCTAssertEqual(RentalCarCost(5), 180)
      XCTAssertEqual(RentalCarCost(7), 230)
      XCTAssertEqual(RentalCarCost(8), 270)
      XCTAssertEqual(RentalCarCost(9), 310)
      XCTAssertEqual(RentalCarCost(10), 350)
    }
    
    func testSumOfPositives() {
        XCTAssertEqual(sumOfPositives([1,2,3,4,5]), 15);
        XCTAssertEqual(sumOfPositives([1,-2,3,4,5]), 13);
        XCTAssertEqual(sumOfPositives([-1,2,3,4,-5]), 9);
    }
}
TestSuite.defaultTestSuite.run()
//: [Next](@next)
