//
//  MainViewModel.swift
//  MyMVVMProject
//
//  Created by André Salla on 18/04/20.
//  Copyright © 2020 André Salla. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    
    func listAllMovies()
    
    func getMovie(at index: Int) -> MovieView?
    
    var movieCount: Int { get }
    
}

protocol MainViewModelDelegate: AnyObject {
    
    func successList()
    func errorList(message: String)
    
}

class MainViewModel: MainViewModelProtocol {
    
    var movieCount: Int {
        listMovies.count
    }
    
    weak var delegate: MainViewModelDelegate?
    var listMovies: [Movie] = []
    
    func listAllMovies() {
        guard let url = URL(string: "https://ghibliapi.herokuapp.com/films") else { return }
        URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            if let errorNonOptional = error {
                self?.listMovies = []
                self?.delegate?.errorList(message: errorNonOptional.localizedDescription)
            } else if let dataNonOptional = data {
                do {
                    let movieList = try JSONDecoder().decode(Array<Movie>.self, from: dataNonOptional)
                    self?.listMovies = movieList
                    self?.delegate?.successList()
                } catch {
                    self?.listMovies = []
                    self?.delegate?.errorList(message: error.localizedDescription)
                }
            } else {
                self?.listMovies = []
                self?.delegate?.successList()
            }
        }.resume()
    }
    
    func getMovie(at index: Int) -> MovieView? {
        if listMovies.count > index && index >= 0 {
            let movie = listMovies[index]
            return MovieView(title: movie.title,
                             description: movie.description,
                             additionalInfo: "\(movie.releaseDate) - Director: \(movie.director) - Producer: \(movie.producer)")
        } else {
            return nil
        }
    }
    
}
