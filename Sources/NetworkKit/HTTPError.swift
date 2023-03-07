import Foundation

public struct HTTPError: Error {
    public enum ErrorCode {
        case unknown
        case cancelled              //  The user cancelled the request
        case insecureConnection     //  TLS - failed to establish a secure connection
        case cannotConnect
        case invalidRequest
        case invalidResponse
        case httpError(HTTPStatusCode)
    }
    
    public let errorCode: ErrorCode
    public let request: HTTPRequest
    public let response: HTTPResponse?
    public let underlyingError: Error?
    
    init(
        errorCode: ErrorCode,
        request: HTTPRequest,
        response: HTTPResponse? = nil,
        underlyingError: Error? = nil
    ) {
        self.errorCode = errorCode
        self.request = request
        self.response = response
        self.underlyingError = underlyingError
    }
}
