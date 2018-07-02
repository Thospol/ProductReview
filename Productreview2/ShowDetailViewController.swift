//
//  ShowDetailViewController.swift
//  Productreview2
//
//  Created by thospol on 1/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit
import os.log
class ShowDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
	
	@IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var reviewRed: UILabel!
    @IBOutlet weak var reviewYellow: UILabel!
    @IBOutlet weak var reviewGreen: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDesc: UITextView!
	@IBOutlet weak var editButton: UIBarButtonItem!
	
	var productDetail: Product?
	var indexpathProduct: IndexPath?
	var mode: Mode?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        if let product = productDetail {
            navigationItem.title = product.product //แสดงบน navigation
            productName.text   = product.product
            productimage.image = product.photo
            productDesc.text = product.desc
            productPrice.text = String(product.price)
        }
    }
    
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TapPictrue(_ sender: UITapGestureRecognizer) {
        let imagepickerController = UIImagePickerController()
        imagepickerController.sourceType = .photoLibrary
        imagepickerController.delegate = self
        present(imagepickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image")
        }
        // Set ให้ไปลงใน imageview
        productimage.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cancleclick(_ sender: Any) {
		navigationController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
	
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //เป็นการส่งค่าไปยังcontrollerที่เราทำsegue
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? ViewController{
		if let data = productDetail {
			viewController.dataProductViewcontroller = data
			viewController.indexpathProduct = indexpathProduct
			viewController.mode = mode //ส่งค่า modeไปยังController ที่ seque ไปซึ่งจะมีตัวแปรmodeอยู่
			}
		}
	}
	
	
	@IBAction func onEdit(sender: UIBarButtonItem) { //กดปุ่มedit ก็จะsegueไปยังidentitieที่performไว้ แล้วจะส่งค่าต่างๆที่func prepare
		mode = Mode.edit
		performSegue(withIdentifier: "ShowDetailEdit", sender: nil)
	}
    
  
}
