import XCTest
@testable import NetworkKit

final class HTTPBodyTests: XCTestCase {
    func test_constructor() {
        let body = EmptyBody()
        XCTAssertNotNil(body.additionalHeader)
    }
}
