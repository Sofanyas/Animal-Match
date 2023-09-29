//
//  gameView.swift
//  Animal_Guess
//
//  Created by Sofanyas Genene on 9/27/23.
//

import UIKit

class gameView: UIViewController {

    //random num generator to decide which picture to choose
    var picNum = Int.random(in: 1...10)
    
    //random num generator to decide which animal name to choose
    var animalNum = Int.random(in: 1...10)
    
    //points tracker
    var points = 0
    
    //Image output variable
    @IBOutlet weak var imageView: UIImageView!
    
    //Question label variable
    @IBOutlet weak var question: UILabel!
    
    //Animal choice label variable
    @IBOutlet weak var animalChoice: UILabel!
    
    //variable to output points
    @IBOutlet weak var pointsOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //background color of gameView
        self.view.backgroundColor = .systemCyan
        
        //Text format for question prompt
        let fontSize: CGFloat = 35.0
        let font = UIFont.systemFont(ofSize: fontSize)
        question.text = "What is the animal"
        question.font = font
        
        //calling method to set animal image and animal choice name
        setNewQuestion()
        
        //Set font and output of points label
        let pointFontSize: CGFloat = 25.0
        let pointFont = UIFont.systemFont(ofSize: pointFontSize)
        pointsOutput.text = "Points : \(points)"
        question.font = pointFont
        
    }
    
    
    func setNewQuestion(){
        
        //set value for picNum
        picNum = Int.random(in: 1...10)
        
        //temp var holder
        var imageName: String
        
        // Determine the image name based on picNum
        switch picNum {
        case 1:
            imageName = "1.png"
        case 2:
            imageName = "2.png"
        case 3:
            imageName = "3.png"
        case 4:
            imageName = "4.png"
        case 5:
            imageName = "5.png"
        case 6:
            imageName = "6.png"
        case 7:
            imageName = "7.png"
        case 8:
            imageName = "8.png"
        case 9:
            imageName = "9.png"
        case 10:
            imageName = "10.png"
        default:
            // Handle the case for unspecified picNum value with the question mark sign
            imageName = "question.png"
        }
        
        //assings temp var to UIImageView
        if var image = UIImage(named: imageName) {
            imageView.image = image
        } else {
            // Handle the case where the image couldn't be loaded
            print("Image not found for name: \(imageName)")
            
        }
        
        
        //set a value for animalNum
        animalNum = Int.random(in: 1...10)
        
        //sets animal choice name
        switch animalNum {
        case 1:
            animalChoice.text = "Bird?"
        case 2:
            animalChoice.text = "Cat?"
        case 3:
            animalChoice.text = "Alligator?"
        case 4:
            animalChoice.text = "Dog?"
        case 5:
            animalChoice.text = "Giraffe?"
        case 6:
            animalChoice.text = "Horse?"
        case 7:
            animalChoice.text = "Lion?"
        case 8:
            animalChoice.text = "Monkey?"
        case 9:
            animalChoice.text = "Zebra?"
        case 10:
            animalChoice.text = "Rooster?"
        default:
            animalChoice.text = "Loading..."
            
            //Font size/style for animal choice
            let fontSize: CGFloat = 35.0
            let font = UIFont.systemFont(ofSize: fontSize)
            animalChoice.font = font
            
        }
                
    }

    //Action for red button
    @IBAction func redButton(_ sender: Any) {
        
        //checks if the name and picture match by using their assigned numbers
        if picNum != animalNum{
            
            print("Smart choice, that is not the correct animal")
            
            animalNum = picNum
            switch picNum {
            case 1:
                animalChoice.text = "Bird?"
            case 2:
                animalChoice.text = "Cat?"
            case 3:
                animalChoice.text = "Alligator?"
            case 4:
                animalChoice.text = "Dog?"
            case 5:
                animalChoice.text = "Giraffe?"
            case 6:
                animalChoice.text = "Horse?"
            case 7:
                animalChoice.text = "Lion?"
            case 8:
                animalChoice.text = "Monkey?"
            case 9:
                animalChoice.text = "Zebra?"
            case 10:
                animalChoice.text = "Rooster?"
            default:
                animalChoice.text = "Loading..."
            }
            
            return
            
        }else{
            
            print("Wrong choice, that is the correct animal")
            
        }
        
        //sets a new pair to be asked
        setNewQuestion()
    }
    
    
    //Action for green button
        @IBAction func greenButton(_ sender: Any) {
            
            //checks if the name and picture match by using their assigned numbers
            if picNum == animalNum{
                print("Smart choice, that is the correct animal")
                points += 1
                pointsOutput.text = "Points : \(points)"
            }else{
                print("Wrong choice, that is not the correct animal")
            }
            
            //what to do if points reach 10
            if points >= 10 {
                
                //send message user won
                let myController = UIAlertController(title: "Congrats", message: "You Won!", preferredStyle: .alert)
                
                //Give option variable to start new game
                let action = UIAlertAction(title: "New Game", style: .default, handler: {action in self.setNewQuestion()})
                
                //Connect option variable to button
                myController.addAction(action)
                
                //present alert
                present(myController, animated: true)
                
                //points reset to zero
                points = 0
                pointsOutput.text = "Points : \(points)"
            } else {
                
                //sets a new pair to be asked
                setNewQuestion()
            }
            
        }
    
}
