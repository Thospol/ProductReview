import UIKit

class ReviewViewController: UICollectionViewController {
	private let reuseIdentifier = "cellReview"
	
	var productFromProduct: Product?
	var checkNameProduct: String?
	var indexpathProduct: IndexPath?
	var producted = [ReviewProduct]() //ต้องใช้อันนี้ถึงจะไม่เพิ่มตอนกดเข้ามาไหม่ loadReview() จะทำงานตลอด
    override func viewDidLoad() {
        super.viewDidLoad()
		loadReview()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		collectionView?.reloadData()
	}

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelReview.ReviewProducts.count 
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
		let product = ModelReview.ReviewProducts[indexPath.row]
		cell.configureWith(value: product)
        return cell
    }
	
	func loadReview() {
		let photo1 = UIImage(named: "jbl")!
		let photo2 = UIImage(named: "anitech")!

		let addReview1 = ReviewProduct(RProductName: "jbl", RProductImage: photo1, RProductDesc: "ไม่มีข้อมูล", RIcon: ReviewRank.good, RComment: "ใช้งานโอเค สมราคา", RName: "thosapol", RDate: Date())
		let addReview2 = ReviewProduct(RProductName: "anitech", RProductImage: photo2, RProductDesc: "เป็นสินค้าที่ค่อนข้างดี", RIcon: ReviewRank.veryGood, RComment: "ก็โอเคน้ะ", RName:  "udom", RDate: Date())
		ModelReview.ReviewProducts.append(addReview1)
		ModelReview.ReviewProducts.append(addReview2)
		collectionView?.reloadData()
	}
	
	@IBAction func AddReview(_ sender: Any) {
		performSegue(withIdentifier: "AddReview", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? AddReviewViewController{
			if let data = productFromProduct {
				viewController.dataProduct = data
				viewController.indexpathProduct = indexpathProduct
				print("Data is:\(data)")
				print("Index path is:\(viewController.indexpathProduct!)")
			}
		}
		
	}
	@IBAction func unwindToReviewProductList(sender: UIStoryboardSegue) {
		
	}
	
	
	

}
