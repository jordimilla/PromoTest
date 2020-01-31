//
//  HomeViewController.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import RxSwift

class HomeViewController: UIViewController {
    
    var router: HomeRouter
    private var viewModel: HomeViewModel
    private var disposableBag = DisposeBag()
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    var items: [Serie] = []
    
    init(router: HomeRouter,
          viewModel: HomeViewModel) {
         self.router = router
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setDelegates()
        viewModel.getListSeries()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViewModel()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: NSStringFromClass(SeriesCollectionViewCell.self), for: indexPath) as! SeriesCollectionViewCell
        cell.configureCell(serie: items[indexPath.row])
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let serie: Serie = items[indexPath.row]
        router.goDetailViewController(data: serie)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            viewModel.getListSeries()
        }
    }

}

extension HomeViewController {
    
    private func setUpViewModel(){
        viewModel.series.asObservable()
            .bind(onNext: { [weak self] (status) in
                guard let safeStatus = status else{
                    return
                }
                switch safeStatus {
                case .loading:
                    break

                case .success(let array):
                    guard let newElements = array else { return }
                    self?.items += newElements
                    self?.collectionView.reloadData()
                    break
                case .fail:
                    // TODO error handle
                    break
                }

            })
            .disposed(by: disposableBag)
    }
}
