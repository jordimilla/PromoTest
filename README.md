# PromoTest

# Architecture: 
Clean architecture (MVVM)

![alt text](https://raw.githubusercontent.com/wiki/android/architecture-samples/images/mvp-clean.png)

# Technologies: 
Swinject, Rxswift, Moya

-------------------------------------------

# Dependency Rule:

# Presentation 
Layer contains UI that are coordinated by Presenters/ViewModels which execute 1 or multiple. Presentation Layer depends on Domain Layer.

# Domain Layer 
is the most INNER part of the onion (no dependencies with other layers) and it contains Entities & Repository Interfaces. Use cases combine data from 1 or multiple Repository Interfaces.

# Data Layer 
contains Repository Implementations and multiple Data Sources. Repositories are responsible to coordinate data from the different Data Sources. Data Layer depends on Domain Layer.


 # Networking
  pod 'Alamofire'
  pod 'Moya'
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper/RxSwift'
  
  # Reactive
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'Moya-ObjectMapper/RxSwift'
  
  # Utils
  pod 'Swinject'
  pod 'Hue'
  
  # Testing
   pod 'RxBlocking'
   pod 'RxTest'
   pod 'Mockit'
