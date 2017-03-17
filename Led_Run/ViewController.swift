//
//  ViewController.swift
//  Led_Run
//
//  Created by Nguyen Cong Toan on 3/13/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _margin: CGFloat = 40// khoang cach tu mep man hinh toi qua bong
    var _margin1: CGFloat = 70
    var lastOnLed = -1
    var n = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        DrawBall()
        let timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    
    func runningLed()
    {
        if (lastOnLed != -1)
        {
            turnOffLed()
        }
        if (lastOnLed != n - 1)
        {
            lastOnLed = lastOnLed + 1
        }
        else
        {
            lastOnLed = 0
        }
        
                turnOnLed()
    }
    func turnOnLed()
    {
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView
        {
            ball.image = UIImage(named: "green")
        }
    }
    
    func turnOffLed()
    {
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView
        {
            ball.image = UIImage(named: "gray")
        }
    }
    
    func DrawBall()
    {
        for Hang in 0..<n
        {
            for Cot in 0..<n
            {
                let image = UIImage(named: "green")
                let Ball = UIImageView(image: image)
                Ball.center = CGPoint(x: _margin + CGFloat(Hang)*SpaceBetweenBall_Width(), y: _margin1 + CGFloat(Cot)*SpaceBetweenBall_Height())
                   // Ball.tag = Hang + 100
                    Ball.tag = Cot + 100
               
                
                self.view.addSubview(Ball)
            }
        }
    }
    
    func SpaceBetweenBall_Width() -> CGFloat
    {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
        return space
    }
    func SpaceBetweenBall_Height() -> CGFloat
    {
        let space = (self.view.bounds.size.height - 2*_margin1)/CGFloat(n-1)
        return space
    }
    
}

