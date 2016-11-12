//
//  EnterWords.swift
//  MarijnHop-pset2
//
//  Created by Marijn Hop on 12/11/2016.
//  Copyright © 2016 Marijn Hop. All rights reserved.
//

import UIKit

class EnterWords: UIViewController {

    var story: Story!
    var fileName: String?
    var storyTitle: String?
    var content: String?
    var storyString: String?
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var instruction: UITextView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var enterWord: UITextField!
    @IBOutlet weak var submitWord: UIButton!
    @IBOutlet weak var wordsRemaining: UILabel!
    
    
    // When the view loads for the first time
    override func viewDidLoad() {
        
        // Get story
        if let filepath = Bundle.main.path(forResource: fileName!, ofType: ".txt") {
            do {
                content = try String(contentsOfFile: filepath)
                print(content!)
            }
            catch {
                print("content could not be loaded")
            }
        }
        
        story = Story(stream: content!)
        
        // Get title
        titleText.text = storyTitle!
        
        // Get words remaining
        wordsRemaining.text = String(story.getPlaceholderRemainingCount()) + " Words remaining"
        
        // Display the first placeholder.
        let placeholder = story.getNextPlaceholder()
        wordLabel.text = placeholder
        
        // set focus on textfield
        enterWord.becomeFirstResponder()
    }
    
    
    // Everytime a word is submitted
    @IBAction func wordSubmitted(_ sender: UIButton) {
        
        // Remember the word.
        let enteredWord = enterWord.text
        
        // Fill in placeholder in the story
        if enteredWord != "" {
            story.fillInPlaceholder(word: enteredWord!)
        }
        
        // empty text field
        enterWord.text = ""
        
        // Display the next placeholder.
        let placeholder = story.getNextPlaceholder()
        wordLabel.text = placeholder
        
        // set focus on textfield
        enterWord.becomeFirstResponder()
        
        // Get words remaining
        wordsRemaining.text = String(story.getPlaceholderRemainingCount()) + " Words remaining"
        
        // if only 1 word remains, change button color and instruction
        if story.getPlaceholderRemainingCount() == 1 {
            instruction.text = "Submit 1 more word to view your story!"
            submitWord.backgroundColor = UIColor(red:0.31, green:0.76, blue:0.28, alpha:1.0)
        }
        
        // If all words are filled in, go to the next screen.
        if story.isFilledIn() {
            performSegue(withIdentifier: "viewStory", sender: self)
        }
        
    }
    
    // Prepare story for next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        storyString = story.toString()
        
        if let nextVC = segue.destination as? ViewStory {
            nextVC.story = storyString!
            nextVC.storyTitle = storyTitle!
            
        }
    }

}
