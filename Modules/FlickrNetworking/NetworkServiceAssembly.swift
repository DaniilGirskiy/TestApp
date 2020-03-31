import Foundation

public class NetworkServiceAssembly {
    public init() {}
    
    public var network: NetworkService {
        return NetworkServiceImpl()
    }
}
