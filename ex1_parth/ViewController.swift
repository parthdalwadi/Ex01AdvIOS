//
//  ViewController.swift
//  ex1_parth
//
//  Created by Parth Dalwadi on 2020-01-08.
//  Copyright © 2020 Parth Dalwadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    var revercePoint: CGPoint = CGPoint(x: 12.5, y: 12.5)
    var official_revercePoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    
    
    var dir = "S"
    var motion = "UPDOWN"
    var side = "LEFT"
    var t = Timer()
    @IBOutlet weak var mySquare: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
               
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
        
        mySquare.center = CGPoint(x: 12.5, y: 12.5)
        
        
     
        
     down()
        
    }
    
    
    
    func down(){
        dir = "S"
        t.invalidate()
        t = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLocationDOWN), userInfo: nil, repeats: true)
        
    }
    
    func right(){
        
        dir = "E"
        t.invalidate()
        t = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLocationRIGHT), userInfo: nil, repeats: true)
        
    }
    
    
    
    func left(){
        dir = "W"
        t.invalidate()
        t = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLocationLEFT), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    func up(){
        dir = "N"
        t.invalidate()
        t = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLocationUP), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateLocationDOWN(){
        
        
        UIView.animate(withDuration: 0.1) {
            self.mySquare.center = CGPoint(x: self.mySquare.center.x, y: self.mySquare.center.y + 15.0)}
        
        checkReverse()
        
        if (self.mySquare.center.y >= screenHeight - 25.0){
            official_revercePoint = revercePoint
           if(side == "LEFT"){
               
               if (motion == "CLOCK"){up()}
               else if (motion == "ANTICLOCK"){side = "BOTTOM";right()}
               else if (motion == "UPDOWN"){up()}
               
               
               
           }else if(side == "RIGHT"){
               
            if (motion == "CLOCK"){side = "BOTTOM"; left()}
               else if (motion == "ANTICLOCK"){up()}
               
               
               
           }
            
            
        }
        else{ // in the middle
            if(side == "LEFT"){
                           
                           if (motion == "CLOCK"){up()}
                           else if (motion == "ANTICLOCK"){}
                           
                           
                           
        }else if(side == "RIGHT"){
                           
                           if (motion == "CLOCK"){}
                           else if (motion == "ANTICLOCK"){up()}
                           
                }
        }
        
    }
    
    @objc func updateLocationUP(){
           
           
           UIView.animate(withDuration: 0.1) {
               self.mySquare.center = CGPoint(x: self.mySquare.center.x, y: self.mySquare.center.y - 15.0)}
        
        checkReverse()
        
        if (self.mySquare.center.y <= 12.5){// reached end
            official_revercePoint = revercePoint
            if(side == "LEFT"){
                
                if (motion == "CLOCK"){side = "TOP";right()}
                else if (motion == "ANTICLOCK"){down()}
                else if (motion == "UPDOWN"){down()}
                
                
                
            }else if(side == "RIGHT"){
                
                if (motion == "CLOCK"){down()}
                else if (motion == "ANTICLOCK"){side = "TOP";left()}
                
                
                
            }
            
            
            
        }else{// in the middle of the way
            if(side == "LEFT"){
                
                if (motion == "CLOCK"){}
                else if (motion == "ANTICLOCK"){down()}
                
                
                
            }else if(side == "RIGHT"){
                
                if (motion == "CLOCK"){down()}
                else if (motion == "ANTICLOCK"){}
                
                
            }
            
        }
           
           
           
       }

    
    @objc func updateLocationRIGHT(){
           
           
           UIView.animate(withDuration: 0.1) {
            self.mySquare.center = CGPoint(x: self.mySquare.center.x + 15.0, y: self.mySquare.center.y)}
        
        checkReverse()
        
        if (self.mySquare.center.x >= screenWidth - 12.5){
            official_revercePoint = revercePoint
            if(side == "TOP"){
                
                if (motion == "CLOCK"){side = "RIGHT"; down()}
                else if (motion == "ANTICLOCK"){left()}
                
                
                
                
            }else if(side == "BOTTOM"){
                
                if (motion == "CLOCK"){left()}
                else if (motion == "ANTICLOCK"){side = "RIGHT"; up()}
                
                
                
            }
            
            
              
        }else{ // in the middle
            
            if(side == "TOP"){
                
                if (motion == "CLOCK"){}
                else if (motion == "ANTICLOCK"){left()}
                
                
                
            }else if(side == "BOTTOM"){
                
                if (motion == "CLOCK"){left()}
                else if (motion == "ANTICLOCK"){}
                
                
            }
            
            
        }
           
       }
    
    
    @objc func updateLocationLEFT(){
              
              
              UIView.animate(withDuration: 0.1) {
               self.mySquare.center = CGPoint(x: self.mySquare.center.x - 15.0, y: self.mySquare.center.y)}
    
        checkReverse()
        
        if (self.mySquare.center.x <= 12.5){
            official_revercePoint = revercePoint
            if(side == "TOP"){
                
                if (motion == "CLOCK"){right()}
                else if (motion == "ANTICLOCK"){side = "LEFT";down()}
               
                
            }else if(side == "BOTTOM"){
                
                if (motion == "CLOCK"){side = "LEFT"; up()}
                else if (motion == "ANTICLOCK"){right()}
                
            }
            
            
            
        }else{
            
            if(side == "TOP"){
                
                if (motion == "CLOCK"){right()}
                else if (motion == "ANTICLOCK"){}
                
                
                
            }else if(side == "BOTTOM"){
                
                if (motion == "CLOCK"){}
                else if (motion == "ANTICLOCK"){right()}
                
                
            }
            
            
        }
              
    }
    
    
    @IBAction func stop(_ sender: UIButton) {
        
        
        
        //self.mySquare.center = CGPoint(x: 150, y: 150)
        
        t.invalidate()
        
        
    }
    
    @objc func swiped(gesture: UISwipeGestureRecognizer) {
        
        let swipeGesture = gesture as UISwipeGestureRecognizer
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            motion = "CLOCK"
            revercePoint = mySquare.center
        case UISwipeGestureRecognizer.Direction.left:
            motion = "ANTICLOCK"
            revercePoint = mySquare.center
        default:
            break
        }
    }
    
   
    
    func checkReverse() {
        
        if mySquare.center == official_revercePoint{
            
            if motion == "ANTICLOCK" {
                motion = "CLOCK"
                
            }else if (motion == "CLOCK"){
                motion = "ANTICLOCK"
            }
            
        }
        
    }
}

