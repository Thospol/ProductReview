//
//  ShowDetailViewController.swift
//  Productreview2
//
//  Created by thospol on 1/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    var product: Product?
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var productNames: UILabel!
    @IBOutlet weak var productdesc: UITextView!
   
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var reviewRed: UILabel!
    @IBOutlet weak var reviewYellow: UILabel!
    @IBOutlet weak var reviewGreen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func Cancle(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
