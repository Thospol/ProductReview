import UIKit

class ReviewViewController: UICollectionViewController {
	private let reuseIdentifier = "cellReview"
	private var products = [ReviewProduct]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadReview()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell


		let product = products[indexPath.row]
		cell.configureWith(value: product)
        return cell
    }
	
	func loadReview() {
		let photo1 = UIImage(named: "jbl")!
		let photo2 = UIImage(named: "anitech")!

		let addReview1 = ReviewProduct(RProductName: "jbl", RProductImage: photo1, RProductDesc: "ไม่มีข้อมูล", RIcon: ReviewRank.good, RComment: "ใช้งานโอเค สมราคา", RName: "thosapol", RDate: Date())
		let addReview2 = ReviewProduct(RProductName: "anitech", RProductImage: photo2, RProductDesc: "เป็นสินค้าที่ค่อนข้างดี", RIcon: ReviewRank.veryGood, RComment: "ก็โอเคน้ะ", RName:  "udom", RDate: Date())
		products.append(addReview1)
		products.append(addReview2)
	}
	
	@IBAction func AddReview(_ sender: Any) {
		performSegue(withIdentifier: "AddReview", sender: nil)
	}
	
	
	

}
