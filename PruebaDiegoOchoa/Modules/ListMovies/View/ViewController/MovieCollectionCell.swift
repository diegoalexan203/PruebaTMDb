//
//  MovieCollectionCell.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 28/03/21.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {

//    @IBOutlet weak var movieUiImageView: UIImageView!

    @IBOutlet weak var movieUIImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }

//    func loadViewFromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "MovieCollectionCell", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//    return view
//    }

    private func loadViewFromNib() -> UIView {
          let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: type(of: self).description().replacingOccurrences(of: self.description, with: ""), bundle: bundle)
          let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

          return nibView
      }
}
