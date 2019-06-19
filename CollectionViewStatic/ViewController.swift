//
//  ViewController.swift
//  CollectionViewStatic
//
//  Created by Денис Андреев on 6/19/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = ["Cell","Cell1","Cell2","Cell3"]
    var cellSize = Array(repeating: CGSize(width: 170, height: 50), count: 4)

    override func viewDidLoad() {
    }

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellId.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId[indexPath.item], for: indexPath)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {  //защита от кривых рук 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize[indexPath.item]
    }
}


