//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class MovieListViewController: UIViewController {
    var presenter: MovieListPresenterInterface!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _setupCollectionView()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "ACTION"
        if let navigationController = navigationController {
            navigationController.setNavigationBarHidden(false, animated: true)
            navigationController.view.backgroundColor = MovieColor.palette.primaryBlue
            navigationController.setNavigationBarColor(.blue)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MovieColor.palette.white]
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func _setupCollectionView() {
        collectionView.backgroundColor = MovieColor.palette.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieListCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }

}

extension MovieListViewController: MovieListViewInterface {
    
}

extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListCell", for: indexPath)  as! MovieListCell
        cell.setupView(image: "movie", title: "ADMIRAL")
        cell.imageMovie.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.navigate(to: .movieDetail(movieID: 1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 20), height: CGFloat(240.0))
    }
}
