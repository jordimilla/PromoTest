//
//  DetailRouter.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Swinject

protocol DetailRouter {
}

class DetailRouterImpl: DetailRouter {

    private let hostViewControllerProvider: Provider<UIViewController>
    init(hostViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
}
