import XCTest
@testable import NetworkKit

final class HTTPStatusCodeTests: XCTestCase {

    func test_statusCodeGetter() {
        let redirectError = URLError(URLError.Code(rawValue: 303))  //  redirect
        let badRequestError = URLError(URLError.Code(rawValue: 400))  //  badRequest
        let unauthorizedError = URLError(URLError.Code(rawValue: 401))  //  unauthorized
        let requestTimeoutError = URLError(URLError.Code(rawValue: 408))  //  requestTimeout
        let serverFailureErrorLow = URLError(URLError.Code(rawValue: 500))  //  serverFailure low
        let serverFailureErrorHigh = URLError(URLError.Code(rawValue: 599))  //  serverFailure high

        XCTAssertEqual(redirectError.statusCode,
                       HTTPStatusCode.redirect)
        XCTAssertEqual(badRequestError.statusCode,
                       HTTPStatusCode.badRequest)
        XCTAssertEqual(unauthorizedError.statusCode,
                       HTTPStatusCode.unauthorized)
        XCTAssertEqual(requestTimeoutError.statusCode,
                       HTTPStatusCode.requestTimeout)
        XCTAssertEqual(serverFailureErrorLow.statusCode,
                       HTTPStatusCode.serverFailure)
        XCTAssertEqual(serverFailureErrorHigh.statusCode,
                       HTTPStatusCode.serverFailure)
    }
}
