import XCTest
@testable import NetworkKit

final class JSONBodyTests: XCTestCase {
    private struct TestStruct: Codable {
        private(set) var name: String? = nil
    }
    
    func test_constructor() throws {
        let obj = TestStruct()
        let body = JSONBody(obj)
        XCTAssertNotNil(body.additionalHeader)
        XCTAssertNotNil(try body.encode())
    }
}
