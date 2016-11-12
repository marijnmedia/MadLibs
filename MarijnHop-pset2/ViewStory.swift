//
//  ViewStory.swift
//  MarijnHop-pset2
//
//  Created by Marijn Hop on 11/11/2016.
//  Copyright © 2016 Marijn Hop. All rights reserved.
//

import UIKit

class ViewStory: UIViewController {

    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var titleText: UILabel!
    
    var story: Story!
    var fileName: String?
    var storyTitle: String?
    var content: String?
    var storyString: String?
    
    override func viewDidLoad() {
        
        if let filepath = Bundle.main.path(forResource: fileName!, ofType: ".txt") {
            do {
                content = try String(contentsOfFile: filepath)
            }
            catch {
                print("contents could not be loaded")
            }
        }
        
        story = Story(stream: content!)
        storyText.text = story.toString()
        
        let newTitle = storyTitle!
        titleText.text = newTitle
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
