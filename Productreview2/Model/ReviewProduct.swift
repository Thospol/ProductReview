import UIKit

class ReviewProduct {
	var RProductName: String
	var RProductImage: UIImage?
	var RProductDesc: String
	var RIcon: ReviewRank?
	var RComment: String
	var RName: String
	var RDate: Date?
	
	init(RProductName: String, RProductImage: UIImage?, RProductDesc: String,RIcon: ReviewRank?,RComment: String,RName: String,RDate: Date) {
		self.RProductName = RProductName
		self.RProductImage = RProductImage
		self.RProductDesc = RProductDesc
		self.RIcon = RIcon
		self.RComment = RComment
		self.RName = RName
		self.RDate = RDate
	}
	
	var viewDate: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let myString = formatter.string(from: RDate!)
		let yourDate = formatter.date(from: myString)!
		formatter.dateFormat = "dd-MMM-yyyy"
		
		return formatter.string(from: yourDate)
	}
}

enum ReviewRank:String {
	case veryGood = "ดีมาก"
	case good = "ปกติ"
	case bad = "แย่"
	
	}


struct ModelReview {
	static var ReviewProducts = [ReviewProduct].init()
}
