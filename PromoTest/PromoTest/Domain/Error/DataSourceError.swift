import Foundation

public enum DataSourceError: Error {
    case unknown
    case notFound
    case notConnection
}

public protocol ServerError: Error {
    var errorLocalized: String { get }
}

public enum NetworkError : ServerError {
    public var errorLocalized: String {
        switch self {
        case .badRequest(let messageError):
            return messageError
            
        case .notAllowed(let messageError):
            return messageError
            
        case .notAuthorized(let messageError):
             return messageError
        }
    }
    
    case badRequest(messageError: String)
    case notAllowed(messageError: String)
    case notAuthorized(messageError: String)
}


//case network(_ type: NetowrkErrorType, messageLocalized: String)
