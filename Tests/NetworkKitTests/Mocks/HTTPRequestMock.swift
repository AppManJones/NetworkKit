import Foundation
import NetworkKit

struct HTTPRequestMock: HTTPRequest {
    var host: String { "localhost" }
    
    var headers: [String: String] { ["platform": "ios"] }
    
    var method: HTTPMethod { .get }
    
    var path: String { "/test-service/end-point" }
    
    var urlQueryItems: [URLQueryItem] {
        [URLQueryItem(name: "deviceType", value: "all_iphones"),
         URLQueryItem(name: "platform", value: "iOS")]
    }
}
