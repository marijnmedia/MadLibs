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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // prepare for next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextView = segue.destination as? ViewStory {
            nextView.fileName = fileName!
            nextView.storyTitle = storyTitle!
        }
    }
    
    @IBAction func selectTarzan(_ sender: UIButton) {
        fileName = "madlib1_tarzan"
        storyTitle = "Tarzan"
        performSegue(withIdentifier: "viewStory", sender: UIButton.self)
    }
    
    @IBAction func selectUniversity(_ sender: UIButton) {
        fileName = "madlib2_university"
        storyTitle = "University"
        performSegue(withIdentifier: "viewStory", sender: UIButton.self)
    }
    
    @IBAction func selectClothes(_ sender: UIButton) {
        fileName = "madlib3_clothes"
        storyTitle = "Clothes"
        performSegue(withIdentifier: "viewStory", sender: UIButton.self)
    }
    
    @IBAction func selectDance(_ sender: UIButton) {
        fileName = "madlib4_dance"
        storyTitle = "Dance"
        performSegue(withIdentifier: "viewStory", sender: UIButton.self)
    }
    
}
