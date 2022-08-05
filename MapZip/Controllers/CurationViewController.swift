//
//  HomeViewController.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/08.
//

import UIKit

enum Sections: Int {
    case TrendingMovie = 0
    case TrendingTV
    case Popular
    case Upcoming
    case TopRated
}

class CurationViewController: UIViewController {
    
    private let titles = ["Title1", "Title2", "Title3",]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    private var navigationBar : UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.addSubview(homeFeedTable)
        
        view.backgroundColor = .blue
        
        navigationController?.navigationBar.isHidden = true
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        homeFeedTable.separatorStyle = .none
        
//        configNavBar()
        
        homeFeedTable.tableHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        homeFeedTable.showsVerticalScrollIndicator = false
        
        getTrendingItems()
        getTVItems()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    func configNavBar() {
        let navBar = UIView()
        navBar.alpha = 0.5
        let image = UIImageView(image: UIImage(systemName: "flame.fill"))
        navBar.addSubview(image)
        let detailImageContraints = [
            image.widthAnchor.constraint(equalToConstant: 44),
            image.heightAnchor.constraint(equalToConstant: 44),
            image.leadingAnchor.constraint(equalTo: navBar.leadingAnchor),
            image.topAnchor.constraint(equalTo: navBar.topAnchor)
        ]
        NSLayoutConstraint.activate(detailImageContraints)
        
        let person = UIImageView(image: UIImage(systemName: "person.fill"))
        NSLayoutConstraint.activate([
            person.widthAnchor.constraint(equalToConstant: 44),
            person.heightAnchor.constraint(equalToConstant: 44),
            person.trailingAnchor.constraint(equalTo: navBar.trailingAnchor),
            person.topAnchor.constraint(equalTo: navBar.topAnchor)
        ])
        navBar.addSubview(person)
        
        navBar.alpha = 0.5
        self.view.addSubview(navBar)
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        self.navigationBar = navBar
    }

    func getTrendingItems(){
//        let caller = APICaller.shared
//        caller.getTrendingItems(completion: { response in
//            switch response.result {
//            case .success(let movies):
//                debugPrint("success:\(movies.results)")
//                break
//            case .failure(let error):
//                debugPrint("error:\(error)")
//                break
//            }
//        })
    }
    
    func getTVItems(){
//        let caller = APICaller.shared
//        caller.getTrendingTV(completion: { response in
//            switch response.result {
//            case .success(let tv):
//                debugPrint("success:\(tv.results)")
//                break
//            case .failure(let error):
//                debugPrint("error:\(error)")
//                break
//            }
//        })
    }
}

extension CurationViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y-5, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title\(section+1)"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let y = scrollView.contentOffset.y + defaultOffset
        
//        navigationBar?.transform = .init(translationX: 0, y: min(0,-y))
//        navigationBar?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -min(0,-y)).isActive = true
    }
    
}
