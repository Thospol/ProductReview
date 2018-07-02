//
//  ViewController.swift
//  Productreview2
//
//  Created by thospol on 30/6/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit
import os.log
class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
	
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productdesc: UITextView!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
        updateSaveButtonState()
    }
 
    func setTextView(){
        productdesc.layer.borderWidth = 1.0
        productdesc.layer.borderColor = UIColor.clear.cgColor
        productdesc.layer.masksToBounds = true
        productdesc.layer.shadowColor = UIColor.black.cgColor
        productdesc.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        productdesc.layer.shadowOpacity = 1.0
        productdesc.layer.shadowRadius = 2.0
        productdesc.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    //REMARK:- delegateTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // hide the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        productButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //REMARK:- UpdateTextField
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = productName.text ?? ""
         productButton.isEnabled = !text.isEmpty
        
    }
    
    
    
    //REMARK:- delegateimagepicker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
     //REMARK:- TapPictrue
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
    
    //REMARK:- Segua
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if productButton === sender as! UIButton {
            let photos = productimage.image
            let productname = productName.text ?? ""
            let desc = productdesc.text
            let price = productPrice.text
			let product = Product(product: productname, photo: photos, desc: desc!, price: Int(price!)!)
            UserModel.product.append(product)
        }
    }
    
    @IBAction func Cancle(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}


