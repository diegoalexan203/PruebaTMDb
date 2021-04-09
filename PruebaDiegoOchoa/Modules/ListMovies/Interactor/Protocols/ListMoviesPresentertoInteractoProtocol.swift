//
//  ListMoviesPresentertoInteractoProtocol.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 28/03/21.
//

import Foundation

protocol ListMoviesPresentertoInteractoProtocol: class {
    var presenter : ListMoviesInteractorToPresenterProtocol? {get set}
    
    func getMovies(page: String)
}
