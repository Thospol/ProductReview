//
//  ShowReviewCollectionViewController.swift
//  Productreview2
//
//  Created by thospol on 2/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellReview"
class ShowReviewCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
		loadReview()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ModelReview.ReviewProducts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
		let ReviewProducts = ModelReview.ReviewProducts[indexPath.row]
		let date = ReviewProducts.RDate
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let myString = formatter.string(from: date!)
		let yourDate: Date? = formatter.date(from: myString)
		formatter.dateFormat = "dd-MMM-yyyy"
		let DateupdatedString = formatter.string(from: yourDate!)
		cell.productNameReview.text = ReviewProducts.RProductName
		cell.productDateReview.text = DateupdatedString
		cell.productDescReview.text = ReviewProducts.RProductDesc
		cell.contentView.layer.cornerRadius = 10
		cell.contentView.layer.borderWidth = 1.0
		cell.contentView.layer.borderColor = UIColor.clear.cgColor
		cell.contentView.layer.masksToBounds = true
		cell.layer.shadowColor = UIColor.lightGray.cgColor
		cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
		cell.layer.shadowRadius = 2.0
		cell.layer.shadowOpacity = 1.0
		cell.layer.masksToBounds = false
		cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
	
	func loadReview() {
		let photo1 = UIImage(named: "jbl")!
		let photo2 = UIImage(named: "anitech")!

		let addReview1 = ReviewProduct(RProductName: "jbl", RProductImage: photo1, RProductDesc: "ไม่มีข้อมูล", RIcon: ReviewRank.good, RComment: "ใช้งานโอเค สมราคา", RName: "thosapol", RDate: Date())
		let addReview2 = ReviewProduct(RProductName: "anitech", RProductImage: photo2, RProductDesc: "เป็นสินค้าที่ค่อนข้างดี", RIcon: ReviewRank.veryGood, RComment: "ก็โอเคน้ะ", RName:  "udom", RDate: Date())
		ModelReview.ReviewProducts.append(addReview1)
		ModelReview.ReviewProducts.append(addReview2)
	}
	
	@IBAction func AddReview(_ sender: Any) {
		performSegue(withIdentifier: "AddReview", sender: nil)
	}
	
	
	

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
