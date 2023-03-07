import XCTest
@testable import NetworkKit

final class HTTPErrorTests: XCTestCase {
    func test_constructor() {        
        let error = HTTPError(errorCode: .unknown, request: HTTPRequestMock())
        XCTAssertNotNil(error)
    }
}
