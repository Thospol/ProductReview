//
//  ProductCollectionViewController.swift
//  Productreview2
//
//  Created by thospol on 30/6/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit


class ProductCollectionViewController: UICollectionViewController {
    var product = [Product]()
    let reuseIdentifier = "cell1"
    let reuseIden2 = "cell2"
let array = ["","",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
      //  self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count: \(product.count)")
        return product.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ProductCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIden2, for: indexPath as IndexPath) as! ProductCollectionViewCell
            let products = product[indexPath.row]
            cell.productImage.image = products.photo
            cell.productName.text = products.product
            cell.productReview.text = products.desc //ยังแปลก
            cell.productPrice.text = String(products.price)
            cell.productReview.text = "5"
            //cell.backgroundColor = UIColor.darkGray
            return cell
        }

    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    func loadSampleMeals() {
        
        let photo1 = UIImage(named: "jbl")!
        guard let addproduct1 = Product(product: "jbl", photo: photo1, desc: "ไม่มีข้อมูล", price: 599) else {
            fatalError("Unable to instantiate meal1")
        }
        
        let photo2 = UIImage(named: "anitech")!
        guard let addproduct2 = Product(product: "anitech", photo: photo2, desc: "ไม่มีข้อมูล", price: 399) else {
            fatalError("Unable to instantiate meal2")
        }
        let photo3 = UIImage(named: "jbl")!
        guard let addproduct3 = Product(product: "jbl", photo: photo3, desc: "ไม่มีข้อมูล", price: 500) else {
            fatalError("Unable to instantiate meal2")
        }
        
        product += [addproduct1, addproduct2, addproduct3]
    }
    
    
    @IBAction func unwindToProductList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let products = sourceViewController.product {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: product.count, section: 0)
            product.append(products)
            collectionView?.insertItems(at: [newIndexPath])
            
        }
    }
    

 
}


