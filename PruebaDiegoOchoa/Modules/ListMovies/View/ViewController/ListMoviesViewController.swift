//
//  ListMoviesViewController.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 30/03/21.
//

import UIKit

class ListMoviesViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Outtlets

    @IBOutlet var moviesView: UIView!
    var presenter: ListMoviesViewToPresenterProtocol?
    @IBOutlet var moviesCollectionView: UICollectionView!

    var moviesList = [MoviesEntity]()
    
//    var moviesList: Array<Dictionary<MoviesEntity,Any>> = [];
    // var moviesList: Array<Dictionary<MoviesEntity,Any>> = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        moviesCollectionView.dataSource = self
       // moviesCollectionView.delegate = self
//        DispatchQueue.main.async {
//            self.presenter?.getListMovies()
//        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    //var item: [String] = ["test1", "test1", "test1", "test1", "test1", "test1", "test1", "test1"]
    //var item: Array<Dictionary<String,Any>> =  ["test1", "test1", "test1", "test1", "test1", "test1", "test1", "test1"]

    public func setUpTableView() {
        let nibcell = UINib(nibName: "MovieCollectionCell", bundle: nil)
        moviesCollectionView.register(nibcell, forCellWithReuseIdentifier: "MovieCollectionCell")
        
    }
}

extension ListMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print (moviesList.count)
        return moviesList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // let row = moviesList[indexPath.row];
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        cell.movieUIImageView.image = UIImage(named: "test1") // item[indexPath.row])
       /// cell.label.text = moviesList[indexPath.row].originalTitle
        print ("entro " + String (indexPath.row) )
        return cell
    }

//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        moviesCollectionView?.collectionViewLayout.invalidateLayout()
//        DispatchQueue.main.async {
//            self.moviesCollectionView.reloadData()
//        }
//    }

}

extension ListMoviesViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(120)  //change "80" with your cell width

        return CGSize(width: width ,height : self.moviesCollectionView.frame.height)
     }
}

extension ListMoviesViewController: ListMoviesPresentertoViewProtocol {
    func updateView(moviesResponse: ResponseMovies) {
//        DispatchQueue.main.async { [self] in
        for movie in moviesResponse.movies! {
            self.moviesList.append(movie)
         }
        //moviesCollectionView!.reloadData()
//        moviesCollectionView!.collectionViewLayout.invalidateLayout()
//        moviesCollectionView!.layoutSubviews()
        moviesCollectionView.reloadData()
        let context = moviesCollectionView.collectionViewLayout.invalidationContext(forBoundsChange: moviesCollectionView.bounds)
        context.contentOffsetAdjustment = CGPoint.zero
        moviesCollectionView.collectionViewLayout.invalidateLayout(with: context)
        moviesCollectionView.layoutSubviews()
        
       // moviesCollectionView.reloadData()
//        DispatchQueue.main.async {
//            print("entro")
//            self.moviesCollectionView.reloadData()
//        }
//        DispatchQueue.main.async {
//            self.moviesCollectionView.performBatchUpdates({ [weak self] in
//            let visibleItems = self?.moviesCollectionView.indexPathsForVisibleItems ?? []
//                self!.moviesCollectionView.reloadItems(at: visibleItems)
//        })
//        }
    }
}
