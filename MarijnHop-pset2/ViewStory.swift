//
//  ViewStory.swift
//  MarijnHop-pset2
//
//  Created by Marijn Hop on 11/11/2016.
//  Copyright © 2016 Marijn Hop. All rights reserved.
//

import UIKit

class ViewStory: UIViewController {
    
    var story: String?
    var storyTitle: String?
    
    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var titleText: UILabel!
    
    // Display story
    override func viewDidLoad() {
    
    storyText.text = story!
    titleText.text = storyTitle!
    }

}
