//
//  MovieHeaderView.swift
//  Movies
//
//  Created by Denis Lebedinsky on 03.04.2022.
//

import UIKit

class MovieHeaderView: UITableViewHeaderFooterView {
    
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLabel.textColor = .white
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfigure(nameArray:  [String],section: Int){
        headerLabel.text = nameArray[section]
       
    }
    
    func setConstraints(){
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}


