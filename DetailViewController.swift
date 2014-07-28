//
//  DetailViewController.swift
//  MMHS_Colleges
//
//  Created by Mobile Makers Academy on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var webpageButton: UIButton!
    @IBOutlet weak var editWebPageTextField: UITextField!
    @IBOutlet weak var editLocationTextField: UITextField!
    @IBOutlet weak var editLocationButton: UIButton!
    @IBOutlet weak var editWebPageButton: UIButton!
    var college : College!
    var collegeArray : [College]!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = college.name
        imageView.image = college.image
        locationButton.setTitle(college.location, forState: .Normal)
        webpageButton.setTitle(college.webpage, forState: .Normal)

        locationButton.setTitleColor(college.secondaryColor, forState: .Normal)
        webpageButton.setTitleColor(college.secondaryColor, forState: .Normal)
        view.backgroundColor = college.color

        editLocationTextField.hidden = true
        editWebPageTextField.hidden = true

        editLocationTextField.delegate = self
        editWebPageTextField.delegate = self
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        if segue.identifier == "Segue_MapView"
        {
            let mapVC = segue.destinationViewController as MapViewController
            mapVC.college = college
            mapVC.colleges = collegeArray
        }
        else
        {
            let webVC = segue.destinationViewController as WebViewController
            webVC.college = college
        }
    }

    @IBAction func onImageTapped(sender: UITapGestureRecognizer)
    {
        let point = sender.locationInView(view) as CGPoint

        if CGRectContainsPoint(imageView.frame, point)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image = image

        college.image = image
    }

    @IBAction func onButtonPressedEditLocation(sender: UIButton)
    {
        editLocationTextField.hidden = false

        locationButton.hidden = true
        editLocationButton.hidden = true
    }

    @IBAction func onButtonPressedEditWebPage(sender: UIButton)
    {
        editWebPageTextField.hidden = false

        webpageButton.hidden = true
        editWebPageButton.hidden = true
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        if editLocationTextField.text != ""
        {
            college.location = editLocationTextField.text
            locationButton.setTitle(editLocationTextField.text, forState: .Normal)
            editLocationButton.hidden = false
        }

        if editWebPageTextField.text != ""
        {
            college.webpage = editWebPageTextField.text
            webpageButton.setTitle(editWebPageTextField.text, forState: .Normal)
            editWebPageButton.hidden = false
        }

        editWebPageTextField.resignFirstResponder()
        editLocationTextField.resignFirstResponder()

        editWebPageTextField.hidden = true
        editLocationTextField.hidden = true

        locationButton.hidden = false
        webpageButton.hidden = false
        return true
    }


}
