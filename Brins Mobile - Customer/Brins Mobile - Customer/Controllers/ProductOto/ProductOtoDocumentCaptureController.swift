//
//  ProductOtoDocumentCaptureController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 17/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductOtoDocumentCaptureControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductOtoDocumentCaptureController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // MARK: USER INTERFACE COMPONENT
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    
    var delegateProductOtoDocumentCaptureController: ProductOtoDocumentCaptureControllerDelegate?
    var imgpickertag : String?
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_VEHICLEDOCUMENT")
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: DELEGATE
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            ImageView.contentMode = .ScaleAspectFit
//            ImageView.image = pickedImage
//        }
        if(imgpickertag == "1")
        {
            btn1.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        else if(imgpickertag == "2")
        {
            btn2.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        else if(imgpickertag == "3")
        {
            btn3.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        else if(imgpickertag == "4")
        {
            btn4.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        else if(imgpickertag == "5")
        {
            btn5.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        else if(imgpickertag == "6")
        {
            btn6.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        }
        
        imgpickertag = ""
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: ACTION
    @IBAction func ActionDocumentCapture1(sender: UIButton)
    {
        imgpickertag = "1"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func ActionDocumentCapture2(sender: UIButton)
    {
        imgpickertag = "2"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func ActionDocumentCapture3(sender: UIButton)
    {
        imgpickertag = "3"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func ActionDocumentCapture4(sender: UIButton)
    {
        imgpickertag = "4"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func ActionDocumentCapture5(sender: UIButton)
    {
        imgpickertag = "5"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func ActionDocumentCapture6(sender: UIButton)
    {
        imgpickertag = "6"
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToNext(sender: UIButton)
    {
        delegateProductOtoDocumentCaptureController?.goToNext()
    }
}
