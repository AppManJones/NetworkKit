import Foundation

public struct HTTPStatusCode: Hashable {
    public static let unknown           = HTTPStatusCode(rawValue: 0)
    public static let ok                = HTTPStatusCode(rawValue: 200)
    public static let redirect          = HTTPStatusCode(rawValue: 303)
    public static let badRequest        = HTTPStatusCode(rawValue: 400)
    public static let unauthorized      = HTTPStatusCode(rawValue: 401)
    public static let requestTimeout    = HTTPStatusCode(rawValue: 408)
    public static let serverFailure     = HTTPStatusCode(rawValue: 500)

    public let rawValue: Int
}

extension URLError {
    public var statusCode: HTTPStatusCode {
        switch code.rawValue {
        case 303: return .redirect
        case 400: return .badRequest
        case 401: return .unauthorized
        case 408: return .requestTimeout
        case 500..<600: return .serverFailure
        default: return .unknown
        }
    }
}
