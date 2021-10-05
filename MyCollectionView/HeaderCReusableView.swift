//
//  HeaderCReusableView.swift
//  MyCollectionView
//
//  Created by Solution Cat on 5/10/21.
//  Copyright © 2021 MatrixSolution. All rights reserved.
//

import UIKit

class HeaderCReusableView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.text = "TRENDING"
    }
    
}
