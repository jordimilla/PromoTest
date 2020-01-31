import Foundation
import Swinject
import UIKit

class HelperAssembly:Assembly{
    
    func assemble(container: Container) {
        // Theme
//        container.register(Theme.self) { _ in
//            ThemeLightImpl()
//        }.inObjectScope(.weak)
//        
//        // FontHelper
//        container.register(FontHelper.self) {r in
//            FontHelperImpl()
//        }.inObjectScope(.weak)
        
          // SchedulerHelper
        container.register(SchedulerHelper.self) {r in
            SchedulerHelperImpl()
        }
    }
}
