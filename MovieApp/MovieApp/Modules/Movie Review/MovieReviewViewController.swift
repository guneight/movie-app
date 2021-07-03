//
//  MovieReviewViewController.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class MovieReviewViewController: UIViewController {
    
    var presenter: MovieReviewPresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "REVIEW"
        if let navigationController = navigationController {
            navigationController.setNavigationBarHidden(false, animated: true)
            navigationController.view.backgroundColor = MovieColor.palette.white
            navigationController.setNavigationBarColor(.white)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: MovieColor.palette.primaryBlue]
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func _setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "MovieReviewCell", bundle: nil), forCellReuseIdentifier: "MovieReviewCell")
    }

}


extension MovieReviewViewController: MovieReviewViewInterface {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension MovieReviewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.movieReview?.totalResults ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieReview = presenter.movieReview?.results else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieReviewCell", for: indexPath) as! MovieReviewCell
        cell.setupView(data: movieReview[indexPath.row])
        return cell
    }

}
