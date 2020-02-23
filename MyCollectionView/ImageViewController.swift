//
//  ViewController.swift
//  MyCollectionView
//
//  Created by Mehedi on 2/23/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let imagesArray = ["banana copy 2", "banana copy 3", "banana copy 4", "banana copy 5", "banana copy 6", "banana copy 7", "banana copy 8", "banana copy 9", "banana copy 10", "banana copy 11", "banana copy 12", "banana copy 13", "banana copy 14", "banana copy 15", "banana copy 16"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.dataSource = self
        self.imageCollectionView.delegate = self
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: ImageCollectionViewCell.id, bundle: nil)
        self.imageCollectionView.register(nib, forCellWithReuseIdentifier: ImageCollectionViewCell.id)
    }
}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 280, height: 200)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.imageCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.id, for: indexPath) as? ImageCollectionViewCell
        let now = self.imagesArray[indexPath.item]
       // print("NO   ", now)
        cell?.selectedImageView.image = UIImage(named: now)
        cell?.selectedImageLabel.text = now
        return cell!
    }
    
    
    
}

