//
//  DetailViewController.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import RxSwift

class DetailViewController: UIViewController {

    let scrollView = UIScrollView()
    let containerView = UIView()
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let ratingLabel = UILabel()
    let sinopsisLabel = UILabel()
    var router: DetailRouter
    var data: Serie?
    private var disposableBag = DisposeBag()
    
    init(router: DetailRouter) {
         self.router = router
         super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    func loadData() {
        guard let data = self.data else { return }
        setUpLabels(data: data)
    }
    
    func setUpLabels(data: Serie) {
        imageView.downloaded(from: data.image)
        nameLabel.text = data.name
        ratingLabel.text = String(data.rating)
        sinopsisLabel.attributedText = data.sinopsis.htmlAttributed(family: sinopsisLabel.font.fontName,
        size: 16,
        color: .black)
    }
    
}
