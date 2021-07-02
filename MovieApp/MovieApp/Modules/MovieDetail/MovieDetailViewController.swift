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


    func _setupTableView() {
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
    
}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        cell.setupView(data: MovieDetailModel.init(adult: true, backdropPath: "sasf", belongsToCollection: "dasda", budget: 20, genres: [Genre.init(id: 1, name: "Action")], homepage: "sasa", id:12, imdbID: "SDasd", originalLanguage: "en", originalTitle: "Fast Farious", overview: "sdbvasdbvhasbdabasbahdbasmncb abmnc amnc amcacsba asc asfas fasf askas ", popularity: 3, posterPath: "sadadasdasdas", productionCompanies: [], productionCountries: [], releaseDate: "10-23-2019", revenue: 12, runtime: 190, spokenLanguages: [], status: "", tagline: "sk faskda s asda ldasdadaklasd asdas", title: "", video: false, voteAverage: 7.9, voteCount: 8990))
        cell.didButtonTapped = {
            print("Tapped")
        }
        return cell
    }

}


