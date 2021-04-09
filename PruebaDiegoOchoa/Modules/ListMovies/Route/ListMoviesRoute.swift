//
//  ListMoviesRoute.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 29/03/21.
//

import Foundation
import UIKit

class ListMoviesRoute: ListMoviesPresenterToRouterProtocol {

    
    
    static func createModule() -> UIViewController {
        
        let moduleStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: ListMoviesViewController.self))
        let view = moduleStoryboard.instantiateViewController(withIdentifier: "ListMoviesViewController") as! ListMoviesViewController

        let presenter : ListMoviesViewToPresenterProtocol & ListMoviesInteractorToPresenterProtocol = ListMoviesPresenter()
        let interactor : ListMoviesPresentertoInteractoProtocol = ListMoviesInteractor()
        let router: ListMoviesPresenterToRouterProtocol = ListMoviesRoute()
//        var list : [MoviesEntity] = []
//        let view = ListMoviesViewController(presenter: presenter, moviesList: list)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
