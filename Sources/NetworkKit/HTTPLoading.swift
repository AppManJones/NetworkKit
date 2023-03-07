import Foundation

public protocol HTTPLoading {
    func load(request: HTTPRequest) async -> HTTPResult
}
