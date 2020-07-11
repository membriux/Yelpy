//
//  PostImageViewController.swift
//  Yelpy
//
//  Created by German Flores on 7/8/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit

protocol PostImageViewControllerDelegate: class  {
    func imageSelected(controller: PostImageViewController, image: UIImage)
}

class PostImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var selectedImageView: UIImageView!
    weak var delegate: PostImageViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        createImagePicker()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    // MARK: Helpers
    func createImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            imagePicker.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: ImagePicker Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[.originalImage] as! UIImage
        //let editedImage = info[.editedImage] as! UIImage
        

        self.selectedImageView.image = originalImage
        
        print("image dismissed")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onFinishPosting(_ sender: Any) {
        performSegue(withIdentifier: "unwindToDetail", sender: self)
        delegate.imageSelected(controller: self, image: self.selectedImageView.image!)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
