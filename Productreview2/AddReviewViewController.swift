//
//  AddReviewViewController.swift
//  Productreview2
//
//  Created by thospol on 2/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

class AddReviewViewController: UIViewController {
	@IBOutlet weak var productName: UITextField!
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productDesc: UITextView!
	@IBOutlet weak var colorGreen: UIButton!
	@IBOutlet weak var colorYellow: UIButton!
	@IBOutlet weak var colorRed: UIButton!
	@IBOutlet weak var peoductReviewDesc: UITextView!
	@IBOutlet weak var nameReview: UITextField!
	@IBOutlet weak var reviewButton: UIButton!
	var dataProduct : Product?
	var indexpathProduct: IndexPath?
	var Rank: ReviewRank? = ReviewRank.veryGood
	
    override func viewDidLoad() {
        super.viewDidLoad()
		if let product = dataProduct {
			navigationItem.title = product.product 
			productName.text   = product.product
			productImage.image = product.photo
			productDesc.text = product.desc
		}
    }
	
	//REMARK:- Segua
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if reviewButton === sender as! UIButton {
			let photos = productImage.image
			let productname = productName.text ?? ""
			let productDesccription = productDesc.text ?? ""
			let ranking = Rank
			let reviewDesc = peoductReviewDesc.text ?? ""
			let nameReviews = nameReview.text ?? ""
			
			let review = ReviewProduct(RProductName: productname, RProductImage: photos, RProductDesc: productDesccription, RIcon: ranking, RComment: reviewDesc, RName: nameReviews, RDate: Date())
			ModelReview.ReviewProducts.append(review)
		}
	}
	
	//REMARK:-Icon
	@IBAction func ClickIconGreen(_ sender: Any) {
		Rank = ReviewRank.veryGood
		print("VeryGood")
	}
	@IBAction func ClickIconYellow(_ sender: Any) {
		Rank = ReviewRank.good
		print("Good")
	}
	@IBAction func ClickIconRed(_ sender: Any) {
		Rank = ReviewRank.bad
		print("Bad")
	}
	
	


}
