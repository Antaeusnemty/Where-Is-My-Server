//
//  ViewController.swift
//  Where is my Server?
//
//  Created by Alex Tyler on 3/29/16.
//  Copyright © 2016 Alex Tyler. All rights reserved.
//  Change the image each time button clicked to match activity?, Add color, Make UI more pleasent *
//  more random number generator-> srandom(UInt32(time(nil))) var randomNumber = random() / (array.count*100000000)
//  having srandom(UInt32(time(nil))) in view did load adds more randomness to Int output dont really even need var randomNumber = random() / (array.count*100000000) because let randomIndex = Int(arc4random_uniform(UInt32(array.count))) is being adjusted by srandom(UInt32(time(nil))) in the view did load

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var longPressRecognizer = UILongPressGestureRecognizer()
    var swipeRecognizer = UISwipeGestureRecognizer()
    let downSwipeRecognizer = UISwipeGestureRecognizer()
    let upSwipeRecognizer = UISwipeGestureRecognizer()
    let leftSwipeRecognizer = UISwipeGestureRecognizer()
    let rightSwipeRecognizer = UISwipeGestureRecognizer()
    
    var musicPlayer : AVAudioPlayer?
    var musicPlayer2 : AVAudioPlayer?
    var w = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("w", ofType: "mp3")!)
    var j = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("j", ofType: "mp3")!)
    @IBOutlet var display: UILabel!
    @IBOutlet var lowerDisplay: UILabel!
    var selected = ""//this a variable that will contain a randomly selected string out of these arrays
    
    var array = ["Your server is currently: Hiding from you around the corner","Your server is currently: Pretending to use the restroom","Your server is currently: Checking SnapChat","Your server is currently: Looking at Twitter","Your server is currently: doing it for the Yeti","Your server is currently: Hitting the Quan","Your server is currently: Doing the Dab","Your server is currently: Joking with co-workers about the table next to you","Your server is currently: Looking for a pen","Your server is currently: Gobbling down dinner as fast as possible","Your server is currently: Paying for jimmy johns out back"]//11
    
    
    var lowerArray = ["Your server is currently: Climbing Mt. Kilimanjaro","Your server is currently: Water skiing in Norway","Your server is currently: Parachuting from the top of the Burj Khalifa","Your server is currently: Playing water polo in England","Your server is currently: Building a zen garden in Tokyo","Your server is currently: Surfing pipeline on the north shore","Your server is currently: Setting the world land speed record for the 30 meter bus-tub dash","Your server is currently: Signing up for HealthCare.gov","Your server is currently: Watching grass grow","Your server is currently: Solving the Yang–Mills mass gap","Your server is currently: Racing in Le Tour de France"] //11
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "th.jpg")//copy this within function in order to add ability to change image upon function run
        srandom(UInt32(time(nil)))
        
        do {
            
            try musicPlayer =  AVAudioPlayer(contentsOfURL: self.j)//need this for both new audio files
            try musicPlayer2 =  AVAudioPlayer(contentsOfURL: self.w)
        }
            
        catch
        {
            print("D'oh")
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
        //display.text = selected ** moved this below actions so it will display changed text on first click
        
        //change the .text of the label(lowerDisplay)
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer2!.play()//play exclamation of namesake
        //generate a random number (within the number of how many strings I have)(could always add more and update range)
        //set it equal to a new variable
        //use the new variable as indexOf() or other index config stuff in order to grab a random string out of array
        let randomIndex = Int(arc4random_uniform(UInt32(array.count))) //Source: http://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array
        //print(randomIndex)//prints Int value (random Int within range of array)
        //print(array[randomIndex])//prints string
        selected = array[randomIndex]
        //print(selected)
        print("button ran")
        
        display.text = selected
        
        var randomNumber = random() / (array.count*100000000)
        print(randomNumber)
        print(array[randomNumber])
    }
    func longPressFunction()
    { print("longPress ran")
        display.text = selected
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer!.play()//play exclamation of namesake
        //generate a random number (within the number of how many strings I have)(could always add more and update range)
        //set it equal to a new variable
        //use the new variable in order to grab a random string out of array
        let randomIndex = Int(arc4random_uniform(UInt32(lowerArray.count)))
        print(randomIndex)//prints Int value (random Int within range of array)
        print(lowerArray[randomIndex])//prints string
        selected = lowerArray[randomIndex]
        print(selected)
        display.text = selected
    }
    func swipeFunction()
    { print("swipeFunction ran")
        display.text = selected
        lowerDisplay.text = "Squeeze or Swipe Here! If your really hangery!"
        musicPlayer!.play()//play exclamation of namesake
        //generate a random number (within the number of how many strings I have)(could always add more and update range)
        //set it equal to a new variable
        //use the new variable as indexOf() or other index config stuff in order to grab a random string out of array
        let randomIndex = Int(arc4random_uniform(UInt32(lowerArray.count)))
        print(randomIndex)//prints Int value (random Int within range of array)
        print(lowerArray[randomIndex])//prints string
        selected = lowerArray[randomIndex]
        print(selected)
        display.text = selected
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() }


}//end of controller

