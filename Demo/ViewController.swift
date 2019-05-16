//
//  ViewController.swift
//  Demo
//
//  Created by Simeon Saint-Saens on 16/5/19.
//  Copyright © 2019 Enabled. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let square = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        square.translatesAutoresizingMaskIntoConstraints = false
        
        square.bounds = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        square.layer.cornerRadius = 7.0
        square.backgroundColor = .red
        
        view.addSubview(square)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateSequence()
    }
    
    func animateSequence() {
        let offset = CGSize(width: 90, height: 120)
        let size = view.bounds.size
        
        square.center = CGPoint(x: offset.width, y: offset.height)
        
        SequenceAnimator.animate(1.0) {
            self.square.center = CGPoint(x: size.width - offset.width, y: offset.height)
        }.animate(0.3) {
            self.square.transform = CGAffineTransform(rotationAngle: .pi/2.0)
        }.done {
            print("First corner")
        }.animate(1.0) {
            self.square.center = CGPoint(x: size.width - offset.width, y: size.height - offset.height)
        }.animate(0.3) {
            self.square.transform = CGAffineTransform(rotationAngle: .pi)
        }.animate(0.3, delay: 0.5) {
            self.square.backgroundColor = .blue
        }.animate(1.0) {
            self.square.center = CGPoint(x: offset.width, y: size.height - offset.height)
        }.animate(0.3) {
            self.square.transform = CGAffineTransform(rotationAngle: .pi*1.5)
        }.animate(1.0) {
            self.square.center = CGPoint(x: offset.width, y: offset.height)
        }.animate(0.3) {
            self.square.transform = CGAffineTransform(rotationAngle: .pi*2.0)
            self.square.backgroundColor = .green
        }.done {
            print("Animation complete")
        }
    }
    
    //Same as above using nested UIView implicit animation syntax
    func animateSequenceUIView() {
        let offset = CGSize(width: 90, height: 120)
        let size = view.bounds.size
        
        square.center = CGPoint(x: offset.width, y: offset.height)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.square.center = CGPoint(x: size.width - offset.width, y: offset.height)
        }) { _ in
            
            UIView.animate(withDuration: 0.3, animations: {
                self.square.transform = CGAffineTransform(rotationAngle: .pi/2.0)
            }) { _ in
                print("First corner")
                
                UIView.animate(withDuration: 1.0, animations: {
                    self.square.center = CGPoint(x: size.width - offset.width, y: size.height - offset.height)
                }) { _ in
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        self.square.transform = CGAffineTransform(rotationAngle: .pi)
                    }) { _ in
                        
                        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
                            self.square.backgroundColor = .blue
                        }) { _ in
                            
                            UIView.animate(withDuration: 1.0, animations: {
                                self.square.center = CGPoint(x: offset.width, y: size.height - offset.height)
                            }) { _ in
                                
                                UIView.animate(withDuration: 0.3, animations: {
                                    self.square.transform = CGAffineTransform(rotationAngle: .pi*1.5)
                                }) { _ in
                                    
                                    UIView.animate(withDuration: 1.0, animations: {
                                        self.square.center = CGPoint(x: offset.width, y: offset.height)
                                    }) { _ in
                                        
                                        UIView.animate(withDuration: 0.3, animations: {
                                            self.square.transform = CGAffineTransform(rotationAngle: .pi*2.0)
                                            self.square.backgroundColor = .green
                                        }) { _ in
                                            print("Animation complete")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}

