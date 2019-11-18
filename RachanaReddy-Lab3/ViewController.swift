//
//  ViewController.swift
//  RachanaReddy-Lab3
//
//  Created by Rachana Reddy on 10/12/19.
//  Copyright © 2019 Rachana Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentWidth = CGFloat(10)
    var currentColor = UIColor.red
    var currentAlpha = CGFloat(10)
    var currentStroke: Stroke?
    
    var redCount = 0
    var orangeCount = 0
    var yellowCount = 0
    var greenCount = 0
    var blueCount = 0
    
    var countArray: [Int] = [5]
    //outlets
    
    @IBOutlet weak var UndoWarning: UILabel!
    @IBOutlet weak var WidthLabel: UILabel!
    @IBOutlet weak var OpacityLabel: UILabel!
    @IBOutlet var DrawingView: DrawingView!
    @IBOutlet weak var WidthSlider: UISlider!
    @IBOutlet weak var OpacitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //color selection buttons
    @IBAction func useRed(_ sender: UIButton) {
        currentColor = UIColor.red
    }
    @IBAction func useOrange(_ sender: UIButton) {
        currentColor = UIColor.orange
    }
    @IBAction func useYellow(_ sender: UIButton) {
        currentColor = UIColor.yellow
    }
    @IBAction func useGreen(_ sender: UIButton) {
        currentColor = UIColor.green
    }
    @IBAction func useBlue(_ sender: UIButton) {
        currentColor = UIColor.blue
    }
    
    //clear button function
    @IBAction func clear(_ sender: Any) {
        DrawingView.currentStroke = nil
        DrawingView.strokesInView = []
    }
    
    //undo button function
    @IBAction func undo(_ sender: Any) {
        generateCounts();
        findMax();
        //if (DrawingView.strokesInView.count > 0) {
            //UndoWarning.textColor = UIColor.clear
            //DrawingView.strokesInView.removeLast()
        //} else {
            //UndoWarning.textColor = UIColor.black
        //}
    }
    
    //override touches functions -> get data from user input
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentStroke = Stroke(points: [touchPoint], width: CGFloat(WidthSlider!.value * 20), color: currentColor, alpha: CGFloat(OpacitySlider!.value))
        currentStroke!.points.append(touchPoint)
        DrawingView.strokesInView.append(currentStroke!) //add the current Stroke to strokes in view array
        UndoWarning.textColor = UIColor.clear //makes warning label clear
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        DrawingView.strokesInView.removeLast()
        currentStroke!.points.append(touchPoint)
        DrawingView.strokesInView.append(currentStroke!) //add the current Stroke to strokes in view array
        UndoWarning.textColor = UIColor.clear //makes warning label clear
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        DrawingView.strokesInView.removeLast()
        currentStroke!.points.append(touchPoint)
        DrawingView.strokesInView.append(currentStroke!) //add the current Stroke to strokes in view array
        UndoWarning.textColor = UIColor.clear //makes warning label clear
    }
    
    func generateCounts() {
        for stroke in DrawingView.strokesInView {
            if (stroke.color == UIColor.red) {
                redCount += stroke.points.count
                print("red: ", redCount);
            } else if (stroke.color == UIColor.orange) {
                orangeCount += stroke.points.count
                print("orange: ", orangeCount);
            } else if (stroke.color == UIColor.yellow) {
                yellowCount += stroke.points.count
                print("yellow:", yellowCount);
            } else if (stroke.color == UIColor.green) {
                greenCount += stroke.points.count
                print("green:", greenCount);
            } else if (stroke.color == UIColor.blue) {
                blueCount += stroke.points.count
                print("blue:", blueCount);
            }
            
        }
    }
    
    func findMax() {
        countArray.append(redCount);
        countArray.append(orangeCount);
        countArray.append(yellowCount);
        countArray.append(greenCount);
        countArray.append(blueCount);
        print(countArray);
        
        countArray.sort()
        print(countArray)
        
        let max1 = countArray[countArray.count - 1];
        let max2 = countArray[countArray.count - 2];
        let max3 = countArray[countArray.count - 3];
        
        print(max1)
        print(max2)
        print(max3)
        
        
        
        //countArray[max1].remove
        
        
    }
    
}

