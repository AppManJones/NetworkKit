import XCTest
@testable import NetworkKit

final class HTTPRequestTests: XCTestCase {
    
    //  MARK: Test HTTPRequest property accessors
    
    func test_host() {
        let expectation = "localhost"
        let result = HTTPRequestMock().host
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_method() {
        let expectation: HTTPMethod = .get
        let result = HTTPRequestMock().method
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_headers() {
        let expectation = ["platform": "ios"]
        let result = HTTPRequestMock().headers
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_path() {
        let expectation = "/test-service/end-point"
        let result = HTTPRequestMock().path
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_urlQueryItems() {
        let expectation = [URLQueryItem(name: "deviceType", value: "all_iphones"),
                           URLQueryItem(name: "platform", value: "iOS")]
        let result = HTTPRequestMock().urlQueryItems
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_url() throws {
        let expectation = "https://localhost/test-service/end-point?deviceType=all_iphones&platform=iOS"
        let result = try XCTUnwrap(HTTPRequestMock().url)
        XCTAssertEqual(result.absoluteString,
                       expectation)
    }
    
    func test_queryItem() throws {
        let expectation = "https"
        let result = HTTPRequestMock().scheme
        XCTAssertEqual(result,
                       expectation)
    }
    
    func test_scheme() throws {
        let expectation = "https"
        let result = HTTPRequestMock().scheme
        XCTAssertEqual(result,
                       expectation)
    }
}
