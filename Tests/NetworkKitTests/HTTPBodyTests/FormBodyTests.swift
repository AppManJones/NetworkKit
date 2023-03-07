import XCTest
import Foundation
@testable import NetworkKit

final class FormBodyTests: XCTestCase {
    func test_init_withArrayOfQueryItems() {
        XCTAssertNotNil(FormBody([URLQueryItem(name: "platform", value: "iOS")]))
    }
    
    func test_init_withDictionary() {
        XCTAssertNotNil(FormBody(["platform":"iOS"]))
    }
    
    func test_propertyAccess() {
        let body = FormBody(["platform":"iOS"])
        XCTAssertNotNil(body.additionalHeader)
    }
    
    func test_encode() throws {
        let body = FormBody(["platform":"iOS"])
        let data = try body.encode()
        XCTAssertNotNil(data)
    }
}
