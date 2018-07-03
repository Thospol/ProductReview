//
//  Product.swift
//  Productreview2
//
//  Created by thospol on 30/6/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit
class Product{
    var product: String
    var photo: UIImage?
    var desc: String
    var price: Int
    
    init(product: String, photo: UIImage?, desc: String,price: Int) {
        self.product = product
        self.photo = photo
        self.desc = desc
        self.price = price
    }
    
}

struct UserModel {
	static var product = [Product].init()
}
