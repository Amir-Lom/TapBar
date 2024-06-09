//
//  ViewController2.swift
//  BarController
//
//  Created by Amir Umarov on 19.05.2024.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getUserNames()
    }
    
    private func setupViews()  {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = names[indexPath.row]
                return cell
    }
    
    private func getUserNames() {
        let names = UserDefaults.standard.array(forKey: "UserNames") as? [String]
        if let names = names, !names.isEmpty {
            self.names = names
        }
    }
    
}


