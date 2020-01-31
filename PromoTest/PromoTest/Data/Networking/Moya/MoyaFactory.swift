import Moya
import Foundation

struct DynamicTarget: TargetType {
    var sampleData: Data
    var task: Task
    var headers: [String : String]?
    let baseURL: URL
    var path: String
    var method: Moya.Method
}

class MoyaFactory{
    
    static func getProvider<Target:TargetType>(baseUrl: String) -> MoyaProvider<Target> {
        return  MoyaProvider<Target>(
            endpointClosure: { (target: Target) -> Moya.Endpoint in rewriteBaseUrl(baseUrl,target)},
            plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)]
        )
    }
    
//    static func getProviderOauth<Target:TargetType>(baseUrl: String,tokenManager:TokenManager) -> MoyaProvider<Target> {
//        return MoyaProvider<Target>(
//            endpointClosure: { (target: Target) -> Moya.Endpoint in
//                rewriteBaseUrl(baseUrl,target)
//        },
//            
//            requestClosure: { (endpoint:Endpoint, done: @escaping MoyaProvider<MultiTarget>.RequestResultClosure) in
//                var request = try! endpoint.urlRequest()
//                request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
//               
//                
//                if !tokenManager.isAccessTokenValid() {
//                    tokenManager.refreshCurrentToken(request: request, requestDone: done)
//                }else{
//                    done(.success(request))
//                }
//        },
//            
//            plugins: [
//                NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter),
//                AccessTokenPlugin {
//                    tokenManager.token
//                }
//            ]
//        )
//    }
    
    
    private static func rewriteBaseUrl(_ baseUrl: String,_ target: TargetType) -> Moya.Endpoint{
        // re-write base url
        let url = "\(baseUrl)\(target.path)"
        
        return  Endpoint(
            url: url,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }
}



