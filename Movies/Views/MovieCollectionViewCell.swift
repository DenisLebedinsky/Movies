//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Denis Lebedinsky on 21.04.2022.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        movieImageView.frame = contentView.bounds
    }
    
    public func configurate(with model: String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }
        
        movieImageView.sd_setImage(with: url)
    }
}
