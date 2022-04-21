//
//  LogoView.swift
//  Movies
//
//  Created by Denis Lebedinsky on 31.03.2022.
//

import Foundation
import UIKit

class LogoView: UIView {
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Mov"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "ies"
        label.textColor = .systemPink
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(firstLabel)
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -18)
        ])
        
        self.addSubview(secondLabel)
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.trailingAnchor, constant: 0),
            secondLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -18)
        ])
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
