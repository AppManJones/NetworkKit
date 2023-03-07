import XCTest
@testable import NetworkKit

final class HTTPLoadingTests: XCTestCase {
    func test_load() async {
        let request = HTTPRequestMock()
        let response = await URLSession(configuration: .default).load(request: request)
        XCTAssertNotNil(response)
    }
}
