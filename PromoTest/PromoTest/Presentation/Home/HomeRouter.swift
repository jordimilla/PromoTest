//
//  HomeRouter.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Swinject

protocol HomeRouter {
    func goDetailViewController(data: Serie)
}

class HomeRouterImpl: HomeRouter {
    
    func goDetailViewController(data: Serie) {
        let mainController = hostViewControllerProvider.instance
        let detailController = detailViewControllerProvider.instance
        (detailController as? DetailViewController)?.data = data
        mainController.pushViewController(detailController, animated: true)
    }
    
    private let hostViewControllerProvider: Provider<UINavigationController>
    private let detailViewControllerProvider: Provider<UIViewController>
    
    init(hostViewControllerProvider: Provider<UINavigationController>,
         detailViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
        self.detailViewControllerProvider = detailViewControllerProvider
    }
}
