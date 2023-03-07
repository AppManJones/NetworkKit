import XCTest
@testable import NetworkKit

final class HTTPResult: XCTestCase {
    func test_propertyAccess() throws {
        let request = HTTPRequestMock()
        let url = try XCTUnwrap(request.url)
        let urlResponse = try XCTUnwrap(HTTPURLResponse(url: url,
                                                        statusCode: 200,
                                                        httpVersion: nil,
                                                        headerFields: [:]))
        let httpResult: Result<HTTPResponse, HTTPError> = .success(HTTPResponse(body: nil,
                                                                                request: request,
                                                                                response: urlResponse))
        XCTAssertNotNil(httpResult.request)
        XCTAssertNotNil(httpResult.response)
    }
}
