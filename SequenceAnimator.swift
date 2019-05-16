//
//  SequenceAnimator.swift
//
//  Created by Simeon Saint-Saens on 14/5/19.
//  Copyright © 2019 Enabled. All rights reserved.
//

import UIKit

class SequenceAnimator {
    
    private var next: SequenceAnimator?
    
    private var completion: (()->Void)?
    private let animation: ()->Void
    
    private let duration: TimeInterval
    private let delay: TimeInterval
    
    private init(duration: TimeInterval, delay: TimeInterval = 0.0, animation: @escaping ()->Void) {
        self.duration = duration
        self.delay = delay
        self.animation = animation
        self.next = nil
    }
    
    private func begin() {
        UIView.animate(withDuration: duration, delay: delay, options: [], animations: animation) {
            _ in

            self.completion?()
            self.next?.begin()
        }
    }
    
    @discardableResult
    func animate(_ duration: TimeInterval, delay: TimeInterval = 0.0, _ animation: @escaping ()->Void) -> SequenceAnimator {
     
        next = SequenceAnimator(duration: duration, delay: delay, animation: animation)
        
        return next!
    }
    
    @discardableResult
    func done(_ completion: @escaping ()->Void) -> SequenceAnimator {
        
        self.completion = completion
        
        return self
    }
    
    @discardableResult
    static func animate(_ duration: TimeInterval, delay: TimeInterval = 0.0, _ animation: @escaping ()->Void) -> SequenceAnimator {
        
        let animator = SequenceAnimator(duration: duration, delay: delay, animation: animation)
        
        animator.begin()
        
        return animator
    }
}
