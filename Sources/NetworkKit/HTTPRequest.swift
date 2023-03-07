import Foundation

fileprivate let _scheme = "https"
fileprivate let _version = "v1"

public protocol HTTPRequest {
    var body: HTTPBody? { get }
    var headers: [String: String] { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var scheme: String { get }
    var url: URL? { get }
    var urlComponents: URLComponents { get }
    var urlRequest: URLRequest? { get }
    var urlQueryItems: [URLQueryItem] { get }
    var apiVersion: String { get }
}

public extension HTTPRequest {
    
    var body: HTTPBody? { nil }
    
    var headers: [String: String] { [:] }
    
    var host: String { "" }
    
    var scheme: String { _scheme }
    
    var urlComponents: URLComponents {
        URLComponents(
            scheme: scheme,
            host: host,
            path: path,
            queryItems: urlQueryItems)
    }
    
    var url: URL? { urlComponents.url }
    
    /** Converts an HTTPRequest into a URLRequest. Header fields encapulated by `HTTPRequest` type are mapped to the new URLRequest. This method throws under two conditions: if the `url` property encapsulated by  `HTTPRequest` cannot be read OR of the json body data cannot be successfully encoded.
     *
     *  - Parameters:
     *          - request: The `HTTPRequest` to be reduced.
     *
     *  - Returns: A URLRequest that encapsulates all reduced from the `HTTPRequest` parameter
     */
    var urlRequest: URLRequest? {
        guard let url = url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        for (header, value) in headers {
            urlRequest.addValue(value,
                                forHTTPHeaderField: header)
        }
        
        if body?.isEmpty == false {
            if let body = body {
                for (header, value) in body.additionalHeader {
                    urlRequest.addValue(value,
                                        forHTTPHeaderField: header)
                }
                do {
                    urlRequest.httpBody = try body.encode()
                } catch {
                    return nil
                }
            }
        }
        
        return urlRequest
    }
    
    var urlQueryItems: [URLQueryItem] { [] }
    
    var apiVersion: String { _version }
}

private extension URLComponents {
    init(scheme: String, host: String, path: String, queryItems: [URLQueryItem]) {
        self.init()
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
}
