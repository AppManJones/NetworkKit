import Foundation

public protocol HTTPBody {
    var isEmpty: Bool { get }
    var additionalHeader: [String: String] { get }
    func encode() throws -> Data
}

public extension HTTPBody {
    var additionalHeader: [String: String] { return [:] }
}
