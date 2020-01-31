//
//  HomeAssembly.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Swinject

class HomeAssembly: Assembly {
    
    func assemble(container: Container) {
        // ViewController
        container.register(UINavigationController.self, name: ScreenTag.home) { inject in
               UINavigationController(rootViewController:
                HomeViewController(
                router: inject.resolve(HomeRouter.self)!,
                viewModel: inject.resolve(HomeViewModel.self)!))
            }
            .inObjectScope(.weak)
        // Router
        container.register(HomeRouter.self) { inject in
            HomeRouterImpl(
                hostViewControllerProvider: inject.resolve(Provider<UINavigationController>.self, name: ScreenTag.home)!,
                detailViewControllerProvider: inject.resolve(Provider<UIViewController>.self, name: ScreenTag.detail)!
            )
        }
        // ViewModel
        container.register(HomeViewModel.self) { inject in
            HomeViewModel(
                seriesRepository: inject.resolve(SeriesRepository.self)!,
                schedulerHelper: inject.resolve(SchedulerHelper.self)!
            )
        }
    }
}
