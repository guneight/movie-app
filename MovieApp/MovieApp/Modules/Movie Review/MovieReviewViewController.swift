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
    
}

extension MovieReviewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieReviewCell", for: indexPath) as! MovieReviewCell
        cell.setupView(data: Results.init(author: "Gun Eight", authorDetails: AuthorDetails.init(name: "Gun", username: "Gun Eight", avatarPath: "ffghvvgq", rating: 10), content: "vghvhgchgc cghcgfc sbfjasbdas asbcjsabas lknbsad asbasdas asbasdbabda sbdudsuiyuiwyebwq ", createdAt: "10-10-2020", id: "10", updatedAt: "10-11-2020", url: "sncasncaskcask"))
      
        return cell
    }

}
