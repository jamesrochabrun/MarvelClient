import XCTest
@testable import MarvelClient

final class MarvelClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MarvelClient().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
