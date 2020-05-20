
import Foundation
import XCTest

/*:
 # Write Number in Expanded Form
 You will be given a number and you will need to return it as a string in Expanded Form. For example:
```
 expandedForm 12    -- Should return '10 + 2'
 expandedForm 42    -- Should return '40 + 2'
 expandedForm 70304 -- Should return '70000 + 300 + 4'
 ```
 NOTE: All numbers will be whole numbers greater than 0.
 */

func highestPositionBase(for num: Int) -> Int {
    
    let numberToString = String(num)
    let numLength = Double(String(numberToString).count)
    
    if let highestDigit = numberToString[numberToString.startIndex].wholeNumberValue {
        let highestBase = highestDigit * Int(pow(10.0, numLength - 1))
        return highestBase
    } else {
        return 0
    }
}

func expandedForm(_ num: Int) -> String {
    var expanded = ""
    
    var highest =  highestPositionBase(for: num)
    expanded = String(highest)
    var nextBase = num - highest
    
     while nextBase > 10 {
        highest = highestPositionBase(for: nextBase)
        expanded += " + \(highest)"
        nextBase = nextBase - highest
        
    }
    
    if nextBase != 0 {
        expanded += " + \(nextBase)"
    }
    
    return expanded
}
/*:
 ## Unit tests
 The unit tests for the first and second attempt
 */
class ExpandedTestSuite: XCTestCase {
    
    static let testValues = [
        (12, "10 + 2"),
        (42, "40 + 2"),
        (70304, "70000 + 300 + 4"),
        (573963350, "500000000 + 70000000 + 3000000 + 900000 + 60000 + 3000 + 300 + 50")
    ]
    
    func testGetHighestBase() {
        XCTAssertEqual(highestPositionBase(for: 70304), 70000)
    }
    
    func tests() {
        for test in ExpandedTestSuite.testValues {
            XCTAssertEqual(expandedForm(test.0), test.1)
        }
    }
}

ExpandedTestSuite.defaultTestSuite.run()

//: [Next](@next)
