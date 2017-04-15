//
//  ViewController.swift
//  calculator
//
//  Created by umair on 4/11/17.
//  Copyright © 2017 4codesolution. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum operations: String {
        case add = "+"
        case subtract = "-"
        case divide = "/"
        case multiply = "*"
       
        case empty = "empty"
    }
    

    @IBOutlet weak var outputLabel: UILabel!
    var isAudioPlayed = AVAudioPlayer()
    var leftStr: String = ""
    var rightStr: String = "" 
    var runningnum: String = ""
    var currentOperation: operations = operations.empty
    var result = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
       
        isSoundLoaded()
    
    }
    
    func isSoundLoaded(){
    do
    {
        isAudioPlayed = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "simple", ofType: "wav")!))
        isAudioPlayed.prepareToPlay()
    }
    catch
    {
        
        print(error)
    }
        
    }
    
  @IBAction func isButtonPressed(PressedButton: UIButton!){
        playSounds()
        runningnum += "\(PressedButton.tag)"
        outputLabel.text = runningnum
    
    }
    
    @IBAction func onAddPressed(_ sender: Any) {
        processFunctions(op: operations.add)
    }
    
    
    @IBAction func onSubtractPressed(_ sender: Any) {
        processFunctions(op: operations.subtract)
    }
    
    @IBAction func onDividedPressed(_ sender: Any) {
        processFunctions(op: operations.divide)
    }
    
    
    @IBAction func onMultiplyPressed(_ sender: Any) {
        processFunctions(op: operations.multiply)
    }
    
    @IBAction func onEqualPressed(_ sender: Any) {
        processFunctions(op: currentOperation)
    }
    func processFunctions(op: operations) {
        playSounds()
       
    if currentOperation != operations.empty{
    if runningnum != "" {
        rightStr = runningnum
        runningnum = ""
    if currentOperation == operations.add {
        result = "\(Double(leftStr)! + Double(rightStr)!)"
            
    }
    else if currentOperation == operations.subtract{
        result = "\(Double(leftStr)! - Double(rightStr)!)"
            
    }
    else if currentOperation == operations.multiply{
        result = "\(Double(leftStr)! * Double(rightStr)!)"
            
    }
    else if currentOperation == operations.divide{
        result = "\(Double(leftStr)! / Double(rightStr)!)"
            
    }
        leftStr = result
        outputLabel.text = leftStr
    }
        
        currentOperation = op
        
    }
    else
    {
        leftStr = runningnum
        runningnum = ""
        currentOperation = op
    
    }
    }
   
    
    func playSounds(){
        
    if isAudioPlayed.play()
    {
        isAudioPlayed.stop()
    }
    else
    {
        isAudioPlayed.play()
    }
        
    }
    
    
}
