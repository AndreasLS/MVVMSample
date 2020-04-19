//
//  MainViewController.swift
//  MyMVVMProject
//
//  Created by André Salla on 18/04/20.
//  Copyright © 2020 André Salla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        viewModel?.delegate = self
        viewModel?.listAllMovies()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension MainViewController: MainViewModelDelegate {
    
    func errorList(message: String) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func successList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movieCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let movie = viewModel?.getMovie(at: indexPath.row) {
            cell.textLabel?.text = movie.title
        } else {
            cell.textLabel?.text = ""
        }
        return cell
    }
    
}
