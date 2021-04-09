//
//  ListMoviesViewToPresenterProtocol.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 28/03/21.
//

import Foundation

protocol ListMoviesViewToPresenterProtocol : class{
    var view: ListMoviesPresentertoViewProtocol? { get set }
    var interactor: ListMoviesPresentertoInteractoProtocol? { get set }
    var router: ListMoviesPresenterToRouterProtocol? { get set }
    func viewWillAppear()
//    func getListMovies()
}
