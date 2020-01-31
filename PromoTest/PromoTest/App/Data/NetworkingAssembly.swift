import Foundation
import Swinject
import UIKit
import Moya

class NetworkingAssembly: Assembly{
    
    func assemble(container: Container) {
        
        container.register(NetworkConfig.self) { _ in
             #if DEBUG
             return NetworkConfig(serverUrlBase: "http://api.tvmaze.com/")
             #else
             return NetworkConfig(serverUrlBase: "http://api.tvmaze.com/")
             #endif
             }.inObjectScope(.container)
        
        container.register(SeriesServices.self) { r in
            SeriesServicesImpl(
                provider: r.resolve(MoyaProvider<SeriesAPI>.self)!
            )
            }.inObjectScope(.container)
        
        container.register(MoyaProvider<SeriesAPI>.self) { r in
            let networkingConfig =  r.resolve(NetworkConfig.self)!
            let provider:MoyaProvider<SeriesAPI> = MoyaFactory.getProvider(baseUrl: networkingConfig.serverUrlBase)
            return provider
        }
    }
}
