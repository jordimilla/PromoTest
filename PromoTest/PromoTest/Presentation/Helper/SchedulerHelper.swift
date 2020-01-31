import Foundation
import RxSwift

public protocol SchedulerHelper {
    var backgroundWorkScheduler: ImmediateSchedulerType { get }
    var mainScheduler: SchedulerType { get }
}

public class SchedulerHelperImpl:SchedulerHelper{
    public var backgroundWorkScheduler: ImmediateSchedulerType {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return OperationQueueScheduler(operationQueue: operationQueue)
    }
    
    public var mainScheduler: SchedulerType {
        return MainScheduler.instance
    }
    
    public init() {
    }
}
