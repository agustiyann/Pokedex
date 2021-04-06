import XCTest
@testable import Pokemon

final class PokemonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Pokemon().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
