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
    
}

extension OfficialGenreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfficialGenreCell", for: indexPath)  as! OfficialGenreCell
        cell.genreLabel.text = "Action"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
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
