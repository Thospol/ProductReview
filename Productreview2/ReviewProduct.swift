
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
}

enum ReviewRank {
	case veryGood,good,bad
}

struct ModelReview {
	static var ReviewProducts = [ReviewProduct].init()
}
