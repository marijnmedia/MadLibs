//
//  SelectStory.swift
//  MarijnHop-pset2
//
//  Created by Marijn Hop on 11/11/2016.
//  Copyright © 2016 Marijn Hop. All rights reserved.
//

import UIKit

class SelectStory: UIViewController {

    
    // filename and title for the story to load
    var fileName: String?
    var storyTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // prepare filename and storytitle for next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextView = segue.destination as? EnterWords {
            nextView.fileName = fileName!
            nextView.storyTitle = storyTitle!
        }
    }
    
    // When a button is pressed get filename and storytitle, go to next view
    @IBAction func selectTarzan(_ sender: UIButton) {
        fileName = "madlib1_tarzan"
        storyTitle = "Tarzan"
        performSegue(withIdentifier: "enterWords", sender: UIButton.self)
    }
    
    @IBAction func selectUniversity(_ sender: UIButton) {
        fileName = "madlib2_university"
        storyTitle = "University"
        performSegue(withIdentifier: "enterWords", sender: UIButton.self)
    }
    
    @IBAction func selectClothes(_ sender: UIButton) {
        fileName = "madlib3_clothes"
        storyTitle = "Clothes"
        performSegue(withIdentifier: "enterWords", sender: UIButton.self)
    }
    
    @IBAction func selectDance(_ sender: UIButton) {
        fileName = "madlib4_dance"
        storyTitle = "Dance"
        performSegue(withIdentifier: "enterWords", sender: UIButton.self)
    }
    
}
