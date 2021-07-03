//
//  OfficialGenreViewController.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class OfficialGenreViewController: UIViewController {
    var presenter: OfficialGenrePresenterInterface!
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        _setupCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "GENRE"
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
        collectionView.register(UINib(nibName: "OfficialGenreCell", bundle: nil), forCellWithReuseIdentifier: "OfficialGenreCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
}

extension OfficialGenreViewController: OfficialGenreViewInterface {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension OfficialGenreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.genre?.genres.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfficialGenreCell", for: indexPath)  as! OfficialGenreCell
        if presenter.genre?.genres.count ?? 0 > 0, let name = presenter.genre?.genres[indexPath.row].name {
            cell.genreLabel.text = name
        } else {
            cell.genreLabel.text = "Movie is empty"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.navigate(to: .movieList(genre: presenter.genre?.genres[indexPath.row].name ?? ""))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 20), height: CGFloat(92.0))
    }
}
