import XCTest
@testable import NetworkKit

final class EmptyBodyTests: XCTestCase {
    func test_constructor() throws {
        let body = EmptyBody()
        XCTAssertNotNil(try body.encode())
    }
}
