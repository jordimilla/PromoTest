import Foundation

enum Resource<T>{
    case loading(show: Bool = true)
    case success(T? = nil)
    case fail(String)
    
    public func data() -> T?{
        switch self {
        case .loading:
            return nil
        case .fail:
             return nil
        case .success(let value):
            return value
        }
    }
    
    public static func failUnknown() -> Resource<T>{
        return Resource<T>.fail("error_something_wrong")
    }
    
    public static func failFromError(error: Error) -> Resource<T>{
        if let datasourceError = error as? NetworkError {
            let serverError = datasourceError as ServerError
            return Resource<T>.fail(serverError.errorLocalized)
        }
        
        if let datasourceError = error as? DataSourceError {
            switch datasourceError {
            case .notConnection:
                return Resource<T>.fail("error_no_connection")
                
            default:
                break
            }
        }
        return Resource<T>.fail("error_something_wrong")
    }
}


