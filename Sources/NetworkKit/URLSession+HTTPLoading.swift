import Foundation

extension URLSession: HTTPLoading {
    public func load(request httpRequest: HTTPRequest) async -> HTTPResult {
        guard let urlRequest = httpRequest.urlRequest else {
            return .failure(HTTPError(errorCode: .invalidRequest,
                                      request: httpRequest))
        }
        do {
            let (data, response) = try await data(for: urlRequest)
            guard let response = response as? HTTPURLResponse else {
                return .failure(HTTPError(errorCode: .invalidResponse,
                                          request: httpRequest))
            }
            return .success(HTTPResponse(body: data,
                                         request: httpRequest,
                                         response: response))
        } catch let error as URLError {
            return .failure(HTTPError(errorCode: .httpError(error.statusCode),
                                      request: httpRequest,
                                      response: nil,
                                      underlyingError: error))
        } catch let error {
            return .failure(HTTPError(errorCode: .unknown,
                                      request: httpRequest,
                                      response: nil,
                                      underlyingError: error))
        }
    }
}
