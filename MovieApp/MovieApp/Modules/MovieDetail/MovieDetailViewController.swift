//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var presenter: MovieDetailPresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "MOVIE 1"
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
    
    private func _setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "MovieDetailCell", bundle: nil), forCellReuseIdentifier: "MovieDetailCell")
    }
}

extension MovieDetailViewController: MovieDetailViewInterface {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieDetail = presenter.movieDetail else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        cell.setupView(data: movieDetail)
        cell.didButtonTapped = {
            self.presenter.navigation(to: .review(movieID: movieDetail.id))
        }
        cell.didReviewButtonTapped = {
            self.presenter.navigation(to: .review(movieID: movieDetail.id))
        }
        return cell
    }

}


