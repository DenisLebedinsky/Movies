//
//  HomeViewController.swift
//  Movies
//
//  Created by Denis Lebedinsky on 27.03.2022.
//

import UIKit


enum Sections: Int {
    case TrendingMoview = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["tranding movies", "popular", "tranding tv", "top rated"]
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    let logoView:UIView = LogoView()
    
    let rightBarItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem()
        barItem.tintColor = .white
        barItem.image = UIImage(systemName: "magnifyingglass")
        return barItem
    }()
    
    let leftBarItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem()
        barItem.customView = LogoView()
        return barItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.tabBarController?.tabBar.backgroundColor = .systemPink
        configureNavBar()
    }
    
    private func configureNavBar(){
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        switch indexPath.section {
        case Sections.TrendingMoview.rawValue :
            APICaller.shared.getTrendingMovies { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shared.getTrandingTvs { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shared.getPopular { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovie { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRated { result in
                switch result {
                case .success(let movies):
                    cell.configure(with: movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCelldidTapCell(_ cell: CollectionViewTableViewCell, viewModel: MoviePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            //            let vc = MoviePreviewViewModel()
            //            vc.configure(with: viewModel)
            //            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

