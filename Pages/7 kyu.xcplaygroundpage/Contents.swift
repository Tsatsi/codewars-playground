import UIKit
import XCTest

/*:

 # Flatten and sort an array
 Challenge:

 Given a two-dimensional array of integers, return the flattened version of the array with all the integers in the sorted (ascending) order.

 Example:

 Given [[3, 2, 1], [4, 6, 5], [], [9, 7, 8]], your function should return [1, 2, 3, 4, 5, 6, 7, 8, 9].
 */
func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
  return arr.flatMap({ $0.sorted() }).sorted()
}



class TestSuite: XCTestCase {
    
    func testFlattenAndSort() {
      XCTAssertEqual(flattenAndSort([[Int]]()), [])
      XCTAssertEqual(flattenAndSort([[Int](), []]), [])
      XCTAssertEqual(flattenAndSort([[], [1]]), [1])
      XCTAssertEqual(flattenAndSort([[], [], [], [2], [], [1]]), [1, 2])
      XCTAssertEqual(flattenAndSort([[3, 2, 1], [7, 9, 8], [6, 4, 5]]), [1, 2, 3, 4, 5, 6, 7, 8, 9])
      XCTAssertEqual(flattenAndSort([[1, 3, 5], [100], [2, 4, 6]]), [1, 2, 3, 4, 5, 6, 100])
      XCTAssertEqual(flattenAndSort([[111, 999], [222], [333], [444], [888], [777], [666], [555]]), [111, 222, 333, 444, 555, 666, 777, 888, 999])
    }
        
}
TestSuite.defaultTestSuite.run()

//: [Next](@next)
