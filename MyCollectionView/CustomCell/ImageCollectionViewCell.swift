//
//  ImageCollectionViewCell.swift
//  MyCollectionView
//
//  Created by Mehedi on 2/23/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var selectedImageLabel: UILabel!
    static let id = "ImageCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
