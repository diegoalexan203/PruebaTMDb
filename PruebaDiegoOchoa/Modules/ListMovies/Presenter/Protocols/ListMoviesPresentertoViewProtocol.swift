//
//  ListMoviesPresentertoViewProtocol.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 28/03/21.
//

import Foundation

protocol ListMoviesPresentertoViewProtocol: class {
    func updateView(moviesResponse: ResponseMovies)
}
