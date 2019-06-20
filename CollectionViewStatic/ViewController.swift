//
//  ViewController.swift
//  CollectionViewStatic
//
//  Created by Денис Андреев on 6/19/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollection: UICollectionView!
    var myGesture : UILongPressGestureRecognizer!
    
    var cellId = ["Cell","Cell1","Cell2","Cell3"]
    var cells = [UICollectionViewCell]()
    var cellSize = Array(repeating: CGSize(width: 170, height: 50), count: 4)
    
    override func viewDidLoad() {
        myGesture = UILongPressGestureRecognizer(target: self, action: #selector(myRecognizer))
        myCollection.addGestureRecognizer(myGesture)
    }
    
    @objc func myRecognizer(param:UILongPressGestureRecognizer){
        switch param.state {
        case .began:
            guard let  indexSelected = myCollection.indexPathForItem(at: param.location(in: myCollection)) else {break}
            myCollection.beginInteractiveMovementForItem(at: indexSelected)
        case .changed:
            myCollection.updateInteractiveMovementTargetPosition(param.location(in: param.view))
        case .ended,.cancelled,.failed:
            myCollection.endInteractiveMovement()
        default :
            myCollection.cancelInteractiveMovement()
            
        }
    }
    
}

extension ViewController :UICollectionViewDataSource{
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
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = cellId.remove(at: sourceIndexPath.item)
        cellId.insert(temp, at: destinationIndexPath.item)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        if indexPath.row%2 == 0{
        //            cellSize = [CGSize(width: 210, height: 60),
        //                        CGSize(width: 180, height: 100),
        //                        CGSize(width: 170, height: 80),
        //                        CGSize(width: 150, height: 150),]
        //        }
        //        else{
        //            cellSize = [CGSize(width: (Int.random(in: 5...20)) * 10, height:                  (Int.random(in: 5...20))*10),
        //                        CGSize(width: 180, height: 100),
        //                        CGSize(width: 170, height: 80),
        //                        CGSize(width: 150, height: 150),]
        //        }
        collectionView.reloadItems(at: [indexPath])
        print("You pressed \(cellId[indexPath.item])")
        
        
        switch indexPath.row {
        case 0:
            cellSize[0] = CGSize(width: (Int.random(in: 5...20)) * 10, height: (Int.random(in: 5...20))*10)
        case 1:
            cellSize[1] = CGSize(width: (Int.random(in: 5...20)) * 10, height: (Int.random(in: 5...20))*10)
        case 2:
            cellSize[2] = CGSize(width: (Int.random(in: 5...20)) * 10, height: (Int.random(in: 5...20))*10)
        case 3:
            cellSize[3] = CGSize(width: (Int.random(in: 5...20)) * 10, height: (Int.random(in: 5...20))*10)
        default:
            ()
        }
        collectionView.reloadItems(at: [indexPath])
        
    }
}




