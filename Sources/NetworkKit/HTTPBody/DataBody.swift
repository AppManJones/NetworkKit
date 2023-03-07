import Foundation

public struct DataBody: HTTPBody {
    public let data: Data
    public var isEmpty: Bool { data.isEmpty }
    public var additionalHeader: [String : String]
    
    public init(
        _ data: Data,
        additionalHeader: [String: String] = [:]
    ) {
        self.data = data
        self.additionalHeader = additionalHeader
    }
    
    public func encode() throws -> Data {
        data
    }
}
