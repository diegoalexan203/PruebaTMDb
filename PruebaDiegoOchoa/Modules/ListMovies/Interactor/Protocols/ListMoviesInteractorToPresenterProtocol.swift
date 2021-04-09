//
//  ListMoviesInteractorToPresenterProtocol.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 29/03/21.
//

import Foundation

protocol ListMoviesInteractorToPresenterProtocol : class {
    func refreshData( movies: ResponseMovies)
}
