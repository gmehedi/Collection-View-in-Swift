//
//  ViewController.swift
//  MyCollectionView
//
//  Created by Mehedi on 2/23/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

enum SectionType: String {
    case animale = "animale"
    case fruites = "fruites"
}

enum CellType: String {
    case image = "image"
    case title = "title"
}

protocol CellHandler {
    var cellType: CellType? { get set }
}

protocol SectionHandler: CellHandler {
    var sectionType: SectionType? { get set }
}

class SectionContainer {
    var allSection = [SectionHandler]()
    init(sectionHandlers: [SectionHandler]) {
        self.allSection = sectionHandlers
    }
    
//    func collectionView(index: Int) -> UICollectionViewCell {
//        let currSection =  self.allSection[index]
//    }
}

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let imagesArray = ["banana copy 2", "banana copy 3", "banana copy 4", "banana copy 5", "banana copy 6", "banana copy 7", "banana copy 8", "banana copy 9", "banana copy 10", "banana copy 11", "banana copy 12", "banana copy 13", "banana copy 14", "banana copy 15", "banana copy 16"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imageCollectionView.reloadData()
    }
}

extension ImageViewController {
    fileprivate func prepareCollectionView() {
        self.registerCollectionViewCell()
        self.setCollectionViewDelegate()
        self.setCollectionViewFlowLayout()
    }
}


//MARK: Collection View Flow Layout
extension ImageViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    fileprivate func registerCollectionViewCell(){
        let menuNib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        self.imageCollectionView.register(menuNib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        let headerNib = UINib(nibName: "HeaderCReusableView", bundle: nil)
        self.imageCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCReusableView")
    }
    //MARK: Set Collection View Flow Layout
    fileprivate func setCollectionViewFlowLayout(){
        
        if let layoutMenu = self.imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layoutMenu.scrollDirection = .vertical
            layoutMenu.minimumLineSpacing = CGFloat(10)
            layoutMenu.minimumInteritemSpacing = CGFloat(10)
            layoutMenu.headerReferenceSize = CGSize(width: self.imageCollectionView.frame.size.width, height: 100)
        }
        self.imageCollectionView.contentInset = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 24)
    }
    //MARK: Set Collection View Delegate
    fileprivate func setCollectionViewDelegate(){
//        self.imageCollectionView.delegate = self
//        self.imageCollectionView.dataSource = self
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        switch collectionView {
        case self.imageCollectionView:
            width = collectionView.bounds.width - 100
            height = 100
        default:
            print("Not match")
        }
        return CGSize(width: width, height: height)
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.imageCollectionView:
            return imagesArray.count
        default:
            print("Not Match")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCReusableView", for: indexPath) as! HeaderCReusableView
            sectionHeader.backgroundColor = UIColor.red
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.imageCollectionView:
            
            let cell = self.imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            cell.selectedImageView.image = UIImage(named: self.imagesArray[indexPath.item])
            return cell
        default:
            let cell = self.imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            return cell
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case imageCollectionView:
            break
        default:
            print("Not Match")
        }
    }
}
