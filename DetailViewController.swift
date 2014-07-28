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

    @IBOutlet weak var addressLabel: UILabel!

    var college : College!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = college.name
        imageView.image = college.image
        addressLabel.text = college.location
        view.backgroundColor = college.color
    }

}
