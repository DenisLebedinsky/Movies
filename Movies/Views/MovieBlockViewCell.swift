//
//  MovieViewCell.swift
//  Movies
//
//  Created by Denis Lebedinsky on 03.04.2022.
//

import UIKit

class MovieBlockViewCell: UITableViewCell {
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
           return cv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
        self.addSubview(collectionView)
               collectionView.backgroundColor = .white
               collectionView.delegate = self
               collectionView.dataSource = self
               collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
               collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
               collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
               collectionView.heightAnchor.constraint(equalToConstant: self.frame.width/2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MovieBlockViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
      }
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 5
      }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

}

