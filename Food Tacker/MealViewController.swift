//
//  ViewController.swift
//  Food Tacker
//
//  Created by Jessica Lowry on 2/24/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//
import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        updateSaveButtonState()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {

        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
       
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any])
    {
               let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
               photoImageView.contentMode = .scaleAspectFit
               photoImageView.image = chosenImage
               dismiss(animated:true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
    }
    
   
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer)
    {
        
        nameTextField.resignFirstResponder()
 
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    private func updateSaveButtonState()
    {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}





