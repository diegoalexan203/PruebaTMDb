//
//  ListMoviesPresenter.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 28/03/21.
//

import Foundation

class ListMoviesPresenter:  ListMoviesViewToPresenterProtocol {
  
    
    
    //MARK: - Properties
    var interactor: ListMoviesPresentertoInteractoProtocol?
    var view: ListMoviesPresentertoViewProtocol?
    var router: ListMoviesPresenterToRouterProtocol?
    
    func getListMovies() {
       
    }
    
    func viewWillAppear() {
        interactor?.getMovies(page: "1")
    }
    
}

extension ListMoviesPresenter: ListMoviesInteractorToPresenterProtocol{
    func refreshData(movies: ResponseMovies) {
        view?.updateView(moviesResponse: movies)
    }

}
