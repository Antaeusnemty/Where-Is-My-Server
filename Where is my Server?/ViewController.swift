//
//  ViewController.swift
//  Where is my Server?
//
//  Created by Alex Tyler on 3/29/16.
//  Copyright © 2016 Alex Tyler. All rights reserved.
//  *Change Audio File to exclamation of namesake, Change the image each time button clicked to match activity, Add color, Make UI more pleasent *
//  Still need to add ability to grab a string out of array and set equal to var selected (which is an empty string now)


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    
    var longPressRecognizer = UILongPressGestureRecognizer()
    var swipeRecognizer = UISwipeGestureRecognizer()
    let downSwipeRecognizer = UISwipeGestureRecognizer()
    let upSwipeRecognizer = UISwipeGestureRecognizer()
    let leftSwipeRecognizer = UISwipeGestureRecognizer()
    let rightSwipeRecognizer = UISwipeGestureRecognizer()
    
    var musicPlayer : AVAudioPlayer?
    var a = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a", ofType: "wav")!)
    @IBOutlet var display: UILabel!
    @IBOutlet var lowerDisplay: UILabel!
    var selected = ""//this a variable that will contain a randomly selected string out of these arrays
    
    var array = ["Hiding from you around the corner","Pretending to use the restroom","Checking SnapChat"]
    
    
    var lowerArray = ["Climbing Mt. Kilimanjaro","Water skiing in Norway","Parachuting from the top of the Burj Khalifa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "th.jpg")//copy this within function in order to add ability to change image upon function run
        
        do {
            
            try musicPlayer =  AVAudioPlayer(contentsOfURL: self.a)
        }
            
        catch
        {
            print("D'oh does not compute beep boop beep - oops you broke it")
        }//end of do - catch
        
        //the target is the element (self) //the action is the name of the function that should be called when a swipe happens on a specific object
        longPressRecognizer.addTarget(self, action: "longPressFunction")
        lowerDisplay.addGestureRecognizer(longPressRecognizer)
        lowerDisplay.userInteractionEnabled = true
       
        swipeRecognizer.addTarget(self, action: "swipeFunction")
        downSwipeRecognizer.addTarget(self, action: "swipeFunction")
        upSwipeRecognizer.addTarget(self, action: "swipeFunction")
        leftSwipeRecognizer.addTarget(self, action: "swipeFunction")
        rightSwipeRecognizer.addTarget(self, action: "swipeFunction")
        downSwipeRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        upSwipeRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        
        lowerDisplay.addGestureRecognizer(swipeRecognizer)
        lowerDisplay.addGestureRecognizer(downSwipeRecognizer)
        lowerDisplay.addGestureRecognizer(upSwipeRecognizer)
        lowerDisplay.addGestureRecognizer(leftSwipeRecognizer)
        lowerDisplay.addGestureRecognizer(rightSwipeRecognizer)
        lowerDisplay.userInteractionEnabled = true
        
        
        
        }//end of view did load
    
// I need the ability to grab a string out of an array in all 3 of these functions.*** longPress & swipeFunction should grab a string from lowerArray ***
    @IBAction func button(sender: AnyObject)
    {
        //pick a string out of an array
        //change the .text of the label(display) to random string
        display.text = selected
        
        //change the .text of the label(lowerDisplay)
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer!.play()//play exclamation of namesake
        
    }
    func longPressFunction()
    { print("longPress ran")
        display.text = selected
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer!.play()//play exclamation of namesake
    }
    func swipeFunction()
    { print("swipeFunction ran")
        display.text = selected
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer!.play()//play exclamation of namesake
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() }


}//end of controller

