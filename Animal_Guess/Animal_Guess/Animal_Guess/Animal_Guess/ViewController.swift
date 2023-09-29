//
//  ViewController.swift
//  Animal_Guess
//
//  Created by Sofanyas Genene on 9/27/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gameTitle = "Animal Guess"
        let fontSize: CGFloat = 45.0
        let font = UIFont.systemFont(ofSize: fontSize)
        titleLabel.text = gameTitle
        titleLabel.font = font
        
        //creating a variable that controls the background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //assigning specific image to background variable
        backgroundImage.image = UIImage(named: "background.img")
        
        //to fit correctly
        backgroundImage.contentMode = .scaleAspectFill
        
        //connecting all the pieces and projecting image onto background
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    //function that happens when start button is pressed
    @IBAction func startGame(_ sender: Any) {
       
        //requesting that it connects gameview View controller to vc,
        //if it fails return
        guard let vc = storyboard?.instantiateViewController(identifier: "game_vc") as? gameView else{
            return
        }

        //presenting the connected vc that was previously created
        present(vc, animated: true)

    }
    
}

