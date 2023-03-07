import Foundation

public struct HTTPResponse {
    public let body: Data?
    public let request: HTTPRequest
    private let response: HTTPURLResponse

    public var message: String {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }
    
    public var headers: [AnyHashable: Any] { response.allHeaderFields }
    
    public init(
        body: Data?,
        request: HTTPRequest,
        response: HTTPURLResponse
    ) {
        self.body = body
        self.request = request
        self.response = response
    }
}
