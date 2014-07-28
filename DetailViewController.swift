//
//  DetailViewController.swift
//  MMHS_Colleges
//
//  Created by Richard Fellure on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!

    var college : College!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = college.name
        imageView.image = college.image
        addressButton.setTitle(college.location, forState: .Normal)
    }

}
