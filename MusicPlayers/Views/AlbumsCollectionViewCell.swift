//
//  AlbumsCollectionViewCell.swift
//  MusicPlayers
//
//  Created by Артем Орлов on 20.07.2022.
//

import UIKit
import Kingfisher

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AlbumsCollectionViewCell"
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        let url = URL(string: model)
        posterImageView.kf.setImage(with: url)
    }
}
