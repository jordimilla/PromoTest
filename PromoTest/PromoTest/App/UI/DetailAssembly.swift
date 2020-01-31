//
//  DetailAssembly.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Swinject

class DetailAssembly: Assembly {
    
    func assemble(container: Container) {
        // ViewController
        container.register(UIViewController.self, name: ScreenTag.detail) { inject in
            DetailViewController(
                router: inject.resolve(DetailRouter.self)!
                )
            }
            .inObjectScope(.weak)
        // Router
        container.register(DetailRouter.self) { inject in
           DetailRouterImpl(
                hostViewControllerProvider: inject.resolve(Provider<UIViewController>.self, name: ScreenTag.detail)!
            )
        }
    }
}
