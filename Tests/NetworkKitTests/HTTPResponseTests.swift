import XCTest
@testable import NetworkKit

final class HTTPResponseTests: XCTestCase {
    
    func test_messageGetter() throws {
        let url = try XCTUnwrap(URL(string: "http://localhost/example/path"))
        let urlResponse = try XCTUnwrap(HTTPURLResponse(url: url,
                                                        statusCode: 200,
                                                        httpVersion: nil,
                                                        headerFields: [:]))
        
        let response = HTTPResponse(body: nil,
                                    request: HTTPRequestMock(),
                                    response: urlResponse)
        let result = response.message
        
        XCTAssertEqual(result,
                       "no error")
    }
    
    func test_headerGetter() throws {
        // TODO: Use a test HTTPRequest
        
        let exampleHeader = ["platform": "iOS",
                                                 "version": "v15"]
        let url = try XCTUnwrap(URL(string: "http://localhost/example/path"))
        let urlResponse = try XCTUnwrap(HTTPURLResponse(url: url,
                                                        statusCode: 200,
                                                        httpVersion: nil,
                                                        headerFields: exampleHeader))
        
        let response = HTTPResponse(body: nil,
                                    request: HTTPRequestMock(),
                                    response: urlResponse)
        let result = try XCTUnwrap(response.headers as? [String: String])
        
        XCTAssertEqual(result,
                       exampleHeader)
    }
}
